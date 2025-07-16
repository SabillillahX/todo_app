import 'package:flutter/material.dart';
import 'package:flutter_lab/core/theme/theme_app.dart';

import 'pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

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
