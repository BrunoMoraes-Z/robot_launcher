import 'dart:io';

import 'package:robot_launcher/constants.dart';

class RunningController {
  bool hasGitFolder() {
    var git = Directory.fromUri(
        Uri.directory(sys_dir.path + file_separator + '.git'));
    // print(git.path);
    return git.existsSync();
  }
}
