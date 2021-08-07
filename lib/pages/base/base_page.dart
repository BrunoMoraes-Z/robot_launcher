import 'package:flutter/material.dart';
import 'package:robot_launcher/pages/base/components/body.dart';

class BasePage extends StatelessWidget {
  const BasePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xfff7f7fa),
      ),
      child: BaseBody(),
    );
  }
}
