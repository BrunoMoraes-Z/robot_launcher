import 'package:flutter/material.dart';
import 'package:robot_launcher/constants.dart';
import 'package:robot_launcher/pages/base/base_controller.dart';

class ConfigurationInputArguments extends StatefulWidget {
  final BaseController controller;
  const ConfigurationInputArguments({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _ConfigurationInputArgumentsState createState() =>
      _ConfigurationInputArgumentsState();
}

class _ConfigurationInputArgumentsState
    extends State<ConfigurationInputArguments> {
  var enabled = false;
  String content = '';

  @override
  void initState() {
    super.initState();
    content = this.widget.controller.configN.value.arguments!;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 36,
          width: 600,
          child: TextField(
            controller: TextEditingController(text: content),
            maxLines: 1,
            onChanged: (v) => content = v,
            enabled: enabled,
            style: TextStyle(fontSize: 13),
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              fillColor: Theme.of(context).inputDecorationTheme.fillColor,
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
            ),
          ),
        ),
        SizedBox(width: 30),
        Container(
          height: 36,
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                if (enabled) {
                  this.widget.controller.update('arguments', content);
                }
                enabled = !enabled;
              });
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  enabled ? Colors.greenAccent.shade700 : itemColor),
            ),
            child: Row(
              children: [
                SizedBox(width: 5),
                Text(enabled ? 'Salvar' : 'Editar'),
              ],
            ),
          ),
        )
      ],
    );
  }
}
