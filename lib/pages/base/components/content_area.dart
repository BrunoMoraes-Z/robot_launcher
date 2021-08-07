import 'package:flutter/material.dart';
import 'package:robot_launcher/components/custom_window_bar.dart';
import 'package:robot_launcher/constants.dart';

class ContentArea extends StatefulWidget {
  const ContentArea({
    Key? key,
  }) : super(key: key);

  @override
  _ContentAreaState createState() => _ContentAreaState();
}

class _ContentAreaState extends State<ContentArea> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Column(
          children: [
            CustomWindowBar(),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: contentBackgroundColor,
                ),
                child: AnimatedBuilder(
                  animation: controller,
                  builder: (context, value) {
                    return Padding(
                      padding: EdgeInsets.all(10),
                      child: controller.getStatePage(),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
