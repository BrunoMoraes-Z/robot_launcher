import 'package:flutter/material.dart';
import 'package:robot_launcher/pages/base/components/content_area.dart';
import 'package:robot_launcher/pages/base/components/custom_side_nav_bar.dart';

class BaseBody extends StatelessWidget {
  const BaseBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Row(
            children: [
              CustomSideNavBar(),
              ContentArea(),
            ],
          ),
        ],
      ),
    );
  }
}
