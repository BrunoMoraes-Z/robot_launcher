import 'dart:convert';
import 'dart:io';

import 'package:robot_launcher/constants.dart';
import 'package:robot_launcher/pages/settings/models/config.dart';

void setupConfigFile() {
  var config = File.fromUri(
      Uri.file('${sysDir.path}${Platform.pathSeparator}config.json'));
  if (!config.existsSync()) {
    config.createSync();
    config.writeAsStringSync(json.encode(
      {
        'robot_dir': '',
        'run_command': 'robot',
        'log_dir': 'output',
        'arguments': '',
        'run_file': '.',
        'process': 'robot.exe'
      },
    ));
  }
}

Config readConfigFile() {
  var config = File.fromUri(
      Uri.file('${sysDir.path}${Platform.pathSeparator}config.json'));
  return Config.fromJson(json.decode(config.readAsStringSync()));
}
