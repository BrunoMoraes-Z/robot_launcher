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
      if (data.isNotEmpty) {
        data.split('\r\n').forEach((element) {
          if (element.length > 0) {
            if (element.trim() == 'Already up to date.') {
              controller.add('Você já esta com a versão mais atualizada.');
            } else {
              controller.add(element);
            }
          }
        });
      }
    }
  ];

  Robot({
    required this.dir,
    required this.command,
    required this.arguments,
    required this.file,
    required this.output,
  });

  Future<int> update() async {
    var process = await Process.start(
      'git',
      ['pull'],
      workingDirectory: dir,
      runInShell: true,
    );

    process.stdout.transform(utf8.decoder).listen((event) {
      onStdOut.forEach((element) {
        element(event);
      });
    });
    controller.process = process;

    return await process.exitCode;
  }

  Future<int> start() async {
    String cmd = '';
    if (this.arguments.length > 0) {
      this.arguments.split(' ').forEach((element) {
        if (cmd.isEmpty) {
          cmd = element;
        } else {
          cmd = '$cmd $element';
        }
      });
    }
    cmd = (output.isNotEmpty ? '$cmd -d $output $file' : '$cmd $file').trim();

    controller
        .add('Executando o comando ($command $cmd) dentro da pasta ($dir)');

    var process = await Process.start(
      command,
      cmd.split(' '),
      workingDirectory: dir,
      runInShell: true,
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
