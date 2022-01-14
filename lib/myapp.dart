import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'layout/colors.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Manga JJ',
      theme: ThemeData(
        primarySwatch: AppColors.mcgpalette0,
        backgroundColor: AppColors.primary,
      ),
    ).modular();
  }
}
