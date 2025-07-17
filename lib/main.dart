import 'package:flutter/material.dart';
import 'package:flutter_lab/core/theme/theme_app.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'pages/home_page.dart';

void main() async {
  // init Hive
  await Hive.initFlutter();

  // open a box
  var box = await Hive.openBox('todoBox');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeApp.lightTheme(),
      themeMode: ThemeMode.system,
    );
  }
}
