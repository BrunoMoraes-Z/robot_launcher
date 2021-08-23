import 'dart:io';

import 'package:flutter/material.dart';
import 'package:robot_launcher/pages/base/base_controller.dart';
import 'package:robot_launcher/utils/enums.dart';

final MenuState defaultMenuState = MenuState.runnning;

final Color selectedItemColor = Color(0xffd96d5b);
final Color itemColor = Color(0xff8f92b7);
final Color sideBarColor = Color(0xD80E0C25);
final Color contentBackgroundColor = Color(0xFFEEEEF0);
final Color buttonColor = Color(0xff4e6de9);

final BaseController controller = BaseController(defaultMenuState);

var sysDir = Directory.fromUri(Uri.parse(Platform.script.path)).parent;
