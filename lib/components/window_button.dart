import 'package:flutter/material.dart';

class CustomWindowButton extends StatefulWidget {
  final VoidCallback action;
  final Color backgroundColor;
  final IconData icon;

  CustomWindowButton({
    Key? key,
    required this.action,
    required this.backgroundColor,
    required this.icon,
  }) : super(key: key);

  @override
  _CustomWindowButtonState createState() => _CustomWindowButtonState();
}

class _CustomWindowButtonState extends State<CustomWindowButton> {
  @override
  Widget build(BuildContext context) {
    Color background = widget.backgroundColor;
    return SizedBox(
      width: 20,
      height: 20,
      child: Container(
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(3.5),
        ),
        child: MouseRegion(
          child: InkWell(
            mouseCursor: MouseCursor.defer,
            onTap: widget.action,
            child: Center(
              child: Icon(
                widget.icon,
                size: 14,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
