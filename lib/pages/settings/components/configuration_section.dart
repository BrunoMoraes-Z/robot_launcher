import 'package:flutter/material.dart';

class ConfigurationSection extends StatelessWidget {
  final String title;
  final List<Widget> itens;
  const ConfigurationSection({
    Key? key,
    required this.title,
    required this.itens,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> contents = [
      Row(
        children: [
          Text(
            this.title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      Text(''),
    ];
    contents.addAll(itens);
    return Padding(
      padding: EdgeInsets.only(
        bottom: 10,
        left: 60,
        right: 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: contents,
      ),
    );
  }
}
