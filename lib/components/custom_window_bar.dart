import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:robot_launcher/components/window_button.dart';

class CustomWindowBar extends StatelessWidget {
  const CustomWindowBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 35,
          child: Row(
            children: [
              Expanded(child: MoveWindow(child: Container())),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomWindowButton(
                      backgroundColor: Color(0xFFC9C7C7),
                      action: () => appWindow.minimize(),
                      icon: LineIcons.minus,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    CustomWindowButton(
                      backgroundColor: Color(0xFFC9C7C7),
                      action: () => appWindow.maximizeOrRestore(),
                      icon: LineIcons.stop,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    CustomWindowButton(
                      backgroundColor: Color(0xFFFF5C5C),
                      action: () => appWindow.close(),
                      icon: LineIcons.times,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(
          height: 0.1,
        ),
      ],
    );
  }
}
