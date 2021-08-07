import 'package:flutter/material.dart';

class ConsoleButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback action;
  final Color color;
  final double width;
  final bool enabled;
  const ConsoleButton({
    Key? key,
    this.width = 170,
    this.enabled = true,
    required this.icon,
    required this.label,
    required this.action,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var content = this.label != ''
        ? Row(
            children: [SizedBox(width: 15), Text(this.label)],
          )
        : Container();

    return SizedBox(
      height: 45,
      width: this.width,
      child: ElevatedButton(
        onPressed: this.enabled ? this.action : null,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(this.color),
        ),
        child: Row(
          children: [SizedBox(width: 5), Icon(this.icon), content],
        ),
      ),
    );
  }
}
