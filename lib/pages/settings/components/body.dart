import 'package:flutter/material.dart';
import 'package:robot_launcher/constants.dart';
import 'package:robot_launcher/pages/settings/components/configuration_input_arguments.dart';
import 'package:robot_launcher/pages/settings/components/configuration_input_file.dart';
import 'package:robot_launcher/pages/settings/components/configuration_input_log_dir.dart';
import 'package:robot_launcher/pages/settings/components/configuration_input_run_command.dart';
import 'package:robot_launcher/pages/settings/components/configuration_input_run_file.dart';
import 'package:robot_launcher/pages/settings/components/configuration_section.dart';

class SettingsBody extends StatefulWidget {
  const SettingsBody({Key? key}) : super(key: key);

  @override
  _SettingsBodyState createState() => _SettingsBodyState();
}

class _SettingsBodyState extends State<SettingsBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 60),
            ConfigurationSection(
              title: 'Pasta do Projeto',
              itens: [
                Text('Caminho onde o projeto se encontra.'),
                AnimatedBuilder(
                  animation: controller.config_n,
                  builder: (context, value) {
                    return ConfigurationDirectoryInput(
                      text: controller.config_n.value.robotDir ?? '',
                      controller: controller.config_n,
                      buttonText: 'Escolher',
                      color: itemColor,
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 60),
            ConfigurationSection(
              title: 'Comando & Argumentos',
              itens: [
                Text('Comando que irá inciar o Robô'),
                ConfigurationInputRunCommand(controller: controller),
                SizedBox(height: 30),
                Text('Logs'),
                ConfigurationInputLogDir(controller: controller),
                SizedBox(height: 30),
                Text('Argumentos'),
                ConfigurationInputArguments(controller: controller),
                SizedBox(height: 30),
                Text('Arquivo a ser Executado'),
                ConfigurationInputRunFile(controller: controller),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
