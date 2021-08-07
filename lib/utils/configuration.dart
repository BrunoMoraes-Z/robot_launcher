import 'dart:convert';
import 'dart:io';

import 'package:robot_launcher/constants.dart';
import 'package:robot_launcher/pages/settings/models/config.dart';

void setupConfigFile() {
  var config =
      File.fromUri(Uri.file('${sys_dir.path}${file_separator}config.json'));
  if (!config.existsSync()) {
    config.createSync();
    config.writeAsStringSync(json.encode(
      {
        'robot_dir': '',
        'run_command': 'robot',
        'log_dir': 'output',
        'arguments': '',
        'run_file': '',
      },
    ));
  }
}

Config readConfigFile() {
  var config =
      File.fromUri(Uri.file('${sys_dir.path}${file_separator}config.json'));
  return Config.fromJson(json.decode(config.readAsStringSync()));
}
