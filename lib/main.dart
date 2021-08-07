import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:robot_launcher/pages/base/base_page.dart';
import 'package:robot_launcher/utils/configuration.dart';

void main() {
  runApp(MyApp());
  doWhenWindowReady(
    () {
      final win = appWindow;
      final initialSize = Size(1024, 768);
      win.minSize = initialSize;
      win.size = initialSize;
      win.alignment = Alignment.center;
      win.title = 'Robot Launcher';
      setupConfigFile();
      win.show();
    },
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Robot launcher',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.transparent,
        drawerScrimColor: Colors.transparent,
        body: BasePage(),
      ),
    );
  }
}
