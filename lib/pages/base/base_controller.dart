import 'dart:io';

import 'package:flutter/material.dart';
import 'package:robot_launcher/pages/running/running_page.dart';
import 'package:robot_launcher/pages/settings/models/config.dart';
import 'package:robot_launcher/pages/settings/settings_page.dart';
import 'package:robot_launcher/utils/configuration.dart';
import 'package:robot_launcher/utils/enums.dart';

class BaseController extends ValueNotifier<MenuState> {
  BaseController(MenuState value) : super(value);

  final ValueNotifier<Config> configN = ValueNotifier(readConfigFile());
  late bool autoScrool = true;
  late Process process;
  final ValueNotifier<EngineState> engineState =
      ValueNotifier(EngineState.stopped);
  final Config config = readConfigFile();
  ValueNotifier<List<String>> log = ValueNotifier([]);
  late Map<MenuState, Widget> states = {};
  late Map<MenuState, Widget> pages = {
    MenuState.settings: SettingsPage(),
    MenuState.runnning: RunningPage(),
  };

  void startProcess(String cmd, List<String> args, String dir) async {}

  void updateEngine(EngineState state) {
    engineState.value = state;
    engineState.notifyListeners();
  }

  void add(String line) {
    log.value.add(line);
    log.notifyListeners();
  }

  void clearLog() {
    log.value.clear();
    log.notifyListeners();
  }

  void toggle(MenuState state) {
    value = state;
    notifyListeners();
  }

  Widget getStatePage() {
    if (value == MenuState.runnning || value == MenuState.settings) {
      return pages[value]!;
    }
    return Container();
  }

  void update(key, value) {
    var content = configN.value.toJson();
    if (content.containsKey(key)) {
      if (value is List) {
        content[key] = value.join(' ');
      } else {
        content[key] = value;
      }
      configN.value = Config.fromJson(content);
      configN.notifyListeners();
      configN.value.save();
    }
  }
}
