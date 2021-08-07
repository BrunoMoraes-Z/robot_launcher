import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:robot_launcher/constants.dart';

class Robot {
  final String dir;
  final String command;
  final String arguments;
  final String file;
  final String output;

  List<void Function(String)> onStdOut = [
    (data) {
      data.split('\r\n').forEach(
        (element) {
          if (element.isNotEmpty) {
            controller.add(element);
          }
        },
      );
    }
  ];

  Robot({
    required this.dir,
    required this.command,
    required this.arguments,
    required this.file,
    required this.output,
  });

  Future<int> start() async {
    String cmd = '-d $output';
    if (this.arguments.length > 0) {
      this.arguments.split(' ').forEach((element) {
        cmd = '$cmd -v $element';
      });
    }
    cmd = '$cmd $file';

    controller
        .add('Executando o comando ($command $cmd) dentro da pasta ($dir)');

    var process = await Process.start(
      command,
      cmd.split(' '),
      workingDirectory: dir,
    );

    process.stdout.transform(utf8.decoder).listen((event) {
      onStdOut.forEach((element) {
        element(event);
      });
    });
    controller.process = process;

    return await process.exitCode;
  }
}
