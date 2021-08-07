import 'package:flutter/material.dart';
import 'package:robot_launcher/pages/running/components/console_actions.dart';
import 'package:robot_launcher/pages/running/components/console_screen.dart';

class RunningBody extends StatelessWidget {
  const RunningBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ConsoleActions(),
          Divider(
            height: 0.1,
          ),
          SizedBox(height: 10),
          ConsoleScreen(),
        ],
      ),
    );
  }
}
