import 'dart:io';

import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:robot_launcher/constants.dart';
import 'package:robot_launcher/engine/robot.dart';
import 'package:robot_launcher/pages/running/components/console_button.dart';
import 'package:robot_launcher/pages/running/runnig_controller.dart';
import 'package:robot_launcher/utils/enums.dart';

class ConsoleActions extends StatefulWidget {
  const ConsoleActions({
    Key? key,
  }) : super(key: key);

  @override
  _ConsoleActionsState createState() => _ConsoleActionsState();
}

class _ConsoleActionsState extends State<ConsoleActions> {
  @override
  Widget build(BuildContext context) {
    var syncButton = RunningController().hasGitFolder()
        ? AnimatedBuilder(
            animation: controller.engineState,
            builder: (_, __) {
              return Tooltip(
                message: 'Atualizar Robô',
                preferBelow: false,
                child: ConsoleButton(
                  action: () {
                    controller.clearLog();
                    controller.updateEngine(EngineState.updatting);
                    Future.delayed(Duration(seconds: 3), () {
                      controller.updateEngine(EngineState.stopped);
                    });
                    Robot(
                      dir: controller.configN.value.robotDir!,
                      arguments: controller.configN.value.arguments!,
                      command: controller.configN.value.runCommand!,
                      file: controller.configN.value.runFile!,
                      output: controller.configN.value.logDir!,
                    ).update().then(
                      (value) {
                        controller.updateEngine(EngineState.stopped);
                        if (controller.log.value.isEmpty) {
                          controller.add(
                              'Repositório remoto pode não estar configurado.');
                        }
                      },
                    );
                  },
                  color: Colors.greenAccent.shade700,
                  label: '',
                  enabled: controller.engineState.value == EngineState.stopped,
                  width: 50,
                  icon: LineIcons.syncIcon,
                ),
              );
            },
          )
        : Container();
    return Container(
      height: 70,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 20),
                child: AnimatedBuilder(
                  animation: controller.engineState,
                  builder: (_, __) {
                    return Text.rich(
                      TextSpan(
                        text: 'Status:',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                        children: [
                          TextSpan(text: ' '),
                          TextSpan(
                            text: controller.engineState.value ==
                                    EngineState.running
                                ? 'Executando...'
                                : controller.engineState.value ==
                                        EngineState.stopped
                                    ? 'Parado'
                                    : 'Atualizando...',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: controller.engineState.value ==
                                          EngineState.running ||
                                      controller.engineState.value ==
                                          EngineState.updatting
                                  ? Colors.greenAccent.shade700
                                  : Colors.red[300],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(width: 10),
            AnimatedBuilder(
              animation: controller.engineState,
              builder: (_, __) {
                return Row(
                  children: [
                    syncButton,
                    SizedBox(width: 10),
                    ConsoleButton(
                      action: () {
                        controller.clearLog();
                        controller.updateEngine(EngineState.running);
                        Robot(
                          dir: controller.configN.value.robotDir!,
                          arguments: controller.configN.value.arguments!,
                          command: controller.configN.value.runCommand!,
                          file: controller.configN.value.runFile!,
                          output: controller.configN.value.logDir!,
                        ).start().then(
                              (value) =>
                                  controller.updateEngine(EngineState.stopped),
                            );
                      },
                      enabled:
                          controller.engineState.value == EngineState.stopped,
                      color: buttonColor,
                      label: 'Iniciar',
                      icon: LineIcons.play,
                    ),
                    SizedBox(width: 10),
                    ConsoleButton(
                      action: () {
                        var names =
                            controller.configN.value.process!.split(',');
                        names.forEach((element) {
                          Process.run(
                            'taskkill',
                            ['/f', '/im', element.trim()],
                          );
                        });
                        controller.updateEngine(EngineState.stopped);
                      },
                      enabled:
                          controller.engineState.value == EngineState.running,
                      color: Colors.redAccent,
                      label: 'Finalizar',
                      icon: LineIcons.times,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
