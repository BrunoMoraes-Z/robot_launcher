import 'dart:io';

import 'package:robot_launcher/constants.dart';

class RunningController {
  bool hasGitFolder() {
    var git = Directory.fromUri(
      Uri.directory(sysDir.path + Platform.pathSeparator + '.git'),
    );
    return git.existsSync();
  }
}
