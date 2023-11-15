import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:personal_expense_tracker/pages/splash.dart';
import 'package:personal_expense_tracker/themes/themes.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox('money');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Money Manager',
      theme: myTheme,
      debugShowCheckedModeBanner: false,
      home: const Splash(),
    );
  }
}
