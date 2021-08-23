import 'dart:convert';
import 'dart:io';

import 'package:robot_launcher/constants.dart';

class Config {
  late String? robotDir;
  late String? runCommand;
  late String? logDir;
  late String? arguments;
  late String? runFile;
  late String? process;

  @override
  String toString() {
    return 'Teste(robotDir: $robotDir, runCommand: $runCommand, logDir: $logDir, arguments: $arguments, runFile: $runFile, process: $process)';
  }

  Config.fromJson(Map<String, dynamic> json) {
    robotDir = json['robot_dir'] as String;
    runCommand = json['run_command'] as String;
    logDir = json['log_dir'] as String;
    arguments = json['arguments'] as String;
    runFile = json['run_file'] as String;
    process = json['process'] as String;
  }

  Map<String, dynamic> toJson() => {
        'robot_dir': robotDir,
        'run_command': runCommand,
        'log_dir': logDir,
        'arguments': arguments,
        'run_file': runFile,
        'process': process,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Config &&
        other.arguments == arguments &&
        other.robotDir == robotDir &&
        other.runCommand == runCommand &&
        other.logDir == logDir &&
        other.process == process &&
        other.runFile == runFile;
  }

  @override
  int get hashCode =>
      robotDir.hashCode ^
      runCommand.hashCode ^
      logDir.hashCode ^
      arguments.hashCode ^
      process.hashCode ^
      runFile.hashCode;

  void save() {
    var config = File.fromUri(
        Uri.file('${sysDir.path}${Platform.pathSeparator}config.json'));
    config.writeAsStringSync(json.encode(toJson()));
  }
}
