import 'dart:async';

import 'package:flutter/material.dart';
import 'package:robot_launcher/constants.dart';

class ConsoleScreen extends StatefulWidget {
  const ConsoleScreen({
    Key? key,
  }) : super(key: key);

  _ConsoleScreenState createState() => _ConsoleScreenState();
}

class _ConsoleScreenState extends State<ConsoleScreen> {
  final _controller = ScrollController();

  void initState() {
    const oneSec = const Duration(seconds: 1);
    new Timer.periodic(oneSec, (Timer t) {
      if (controller.autoScrool) {
        if (_controller.positions.isNotEmpty) {
          _controller.jumpTo(_controller.position.maxScrollExtent);
        }
      }
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF909296).withOpacity(0.9),
          borderRadius: BorderRadius.circular(8),
        ),
        child: AnimatedBuilder(
          animation: controller.log,
          builder: (context, _) {
            var log = controller.log.value;
            return ListView(
              scrollDirection: Axis.vertical,
              controller: _controller,
              shrinkWrap: false,
              padding: EdgeInsets.only(
                left: 10,
                top: 5,
                bottom: 5,
                right: 10,
              ),
              children: [
                SelectableText(
                  log.join('\n'),
                  style: TextStyle(color: Colors.white.withOpacity(0.85)),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
