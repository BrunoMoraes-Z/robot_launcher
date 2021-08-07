import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:robot_launcher/constants.dart';

@immutable
class Config {
  late String? robotDir;
  late String? runCommand;
  late String? logDir;
  late String? arguments;
  late String? runFile;

  @override
  String toString() {
    return 'Teste(robotDir: $robotDir, runCommand: $runCommand, logDir: $logDir, arguments: $arguments, runFile: $runFile)';
  }

  Config.fromJson(Map<String, dynamic> json) {
    robotDir = json['robot_dir'] as String;
    runCommand = json['run_command'] as String;
    logDir = json['log_dir'] as String;
    arguments = json['arguments'] as String;
    runFile = json['run_file'] as String;
  }

  Map<String, dynamic> toJson() => {
        'robot_dir': robotDir,
        'run_command': runCommand,
        'log_dir': logDir,
        'arguments': arguments,
        'run_file': runFile,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Config &&
        other.arguments == arguments &&
        other.robotDir == robotDir &&
        other.runCommand == runCommand &&
        other.logDir == logDir &&
        other.runFile == runFile;
  }

  @override
  int get hashCode =>
      robotDir.hashCode ^
      runCommand.hashCode ^
      logDir.hashCode ^
      arguments.hashCode ^
      runFile.hashCode;

  void save() {
    var config =
        File.fromUri(Uri.file('${sys_dir.path}${file_separator}config.json'));
    config.writeAsStringSync(json.encode(toJson()));
  }
}
