import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:robot_launcher/constants.dart';
import 'package:robot_launcher/engine/robot.dart';
import 'package:robot_launcher/pages/running/components/console_button.dart';
import 'package:robot_launcher/pages/running/runnig_controller.dart';

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
        ? Tooltip(
            message: 'Atualizar Robô',
            preferBelow: false,
            child: ConsoleButton(
              action: () {
                controller.updating.value = true;
              },
              color: Colors.greenAccent.shade700,
              label: '',
              enabled: !controller.running.value,
              width: 50,
              icon: LineIcons.syncIcon,
            ),
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
                  animation: controller.running,
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
                            text: controller.running.value
                                ? 'Executando...'
                                : 'Parado',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: controller.running.value
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
              animation: controller.running,
              builder: (_, __) {
                return Row(
                  children: [
                    syncButton,
                    SizedBox(width: 10),
                    ConsoleButton(
                      action: () {
                        controller.clearLog();
                        controller.running.value = true;
                        Robot(
                          dir: controller.config.robotDir!,
                          arguments: controller.config.arguments!,
                          command: controller.config.runCommand!,
                          file: controller.config.runFile!,
                          output: controller.config.logDir!,
                        ).start().then(
                              (value) => controller.running.value = false,
                            );
                      },
                      enabled: !controller.running.value &&
                          !controller.updating.value,
                      color: buttonColor,
                      label: 'Ininicar',
                      icon: LineIcons.play,
                    ),
                    SizedBox(width: 10),
                    ConsoleButton(
                      action: () {
                        controller.running.value = false;
                        controller.process.kill();
                      },
                      enabled: controller.running.value &&
                          !controller.updating.value,
                      color: Colors.redAccent,
                      label: 'Matar',
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
