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
            controller.add(element);
          }
        });
      }
      // data.split('\r\n').forEach(
      //   (element) {
      //     if (element.isNotEmpty) {
      //       controller.add(element);
      //     }
      //   },
      // );
    }
  ];

  Robot({
    required this.dir,
    required this.command,
    required this.arguments,
    required this.file,
    required this.output,
  });

  Future<void> update() async {
    await Process.start('git', ['pull'], workingDirectory: dir).then((value) {
      value.stdout.transform(utf8.decoder).listen((event) {
        onStdOut.forEach((element) {
          element(event);
        });
      });
    });

    // process.stdout.transform(utf8.decoder).listen((event) {
    //   onStdOut.forEach((element) {
    //     element(event);
    //   });
    // });
    // controller.process = process;

    // return await process.exitCode;
  }

  Future<int> start() async {
    String cmd = '';
    if (this.arguments.length > 0) {
      this.arguments.split(' ').forEach((element) {
        cmd = '$cmd $element';
      });
    }
    // cmd = '$cmd $file >> ${sysDir.path}${Platform.pathSeparator}buffer.txt';
    cmd = '$cmd -d $output $file';

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
