import 'package:flutter/material.dart';

class NavBarItem extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback action;
  final Color color;

  NavBarItem({
    Key? key,
    required this.icon,
    required this.label,
    required this.action,
    required this.color,
  }) : super(key: key);

  @override
  _NavBarItemState createState() => _NavBarItemState();
}

class _NavBarItemState extends State<NavBarItem> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: this.widget.action,
      icon: Icon(this.widget.icon),
      tooltip: this.widget.label,
      color: this.widget.color,
      hoverColor: Color(0xffd96d5b),
      iconSize: 30,
    );
  }
}
