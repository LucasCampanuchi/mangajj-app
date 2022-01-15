import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mangajj/init.dart';
import 'package:mangajj/myapp.dart';

import 'app_module.dart';

void main() async {
  await init();

  runApp(
    ModularApp(
      module: AppModule(),
      child: const MyApp(),
    ),
  );
}
