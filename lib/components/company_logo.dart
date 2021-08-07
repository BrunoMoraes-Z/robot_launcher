import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:robot_launcher/constants.dart';

class CompanyLogo extends StatelessWidget {
  const CompanyLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
          child: MoveWindow(),
        ),
        Image.asset(
          'assets/icon.png',
          height: 32,
        ),
        SizedBox(height: 18),
        Divider(
          indent: 10,
          endIndent: 10,
          color: itemColor,
          height: 1,
        ),
        SizedBox(height: 15)
      ],
    );
  }
}
