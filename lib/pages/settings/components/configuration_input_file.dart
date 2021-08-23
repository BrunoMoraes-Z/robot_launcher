import 'dart:io';

import 'package:filepicker_windows/filepicker_windows.dart';
import 'package:flutter/material.dart';
import 'package:robot_launcher/pages/settings/models/config.dart';

class ConfigurationDirectoryInput extends StatelessWidget {
  final String text;
  final ValueNotifier<Config> controller;
  final String buttonText;
  final Color color;
  const ConfigurationDirectoryInput({
    Key? key,
    required this.text,
    required this.controller,
    required this.buttonText,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 36,
          width: 600,
          child: TextField(
            controller: TextEditingController(text: this.text),
            maxLines: 1,
            enabled: false,
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
              var file = OpenFilePicker()..title = 'Escolha a pasta do projeto';

              var result = file.getFile();
              if (result != null) {
                controller.value.robotDir =
                    Directory.fromUri(Uri.file(result.path)).parent.path;
                // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
                controller.notifyListeners();
                controller.value.save();
              }
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(this.color),
            ),
            child: Row(
              children: [
                SizedBox(width: 5),
                Text(this.buttonText),
              ],
            ),
          ),
        )
      ],
    );
  }
}
