import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mangajj/init.dart';
import 'package:mangajj/myapp.dart';

import 'routes/app_module.dart';
import 'themes/theme_changer.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await init();

  runApp(
    ChangeNotifierProvider<ThemeChanger>(
      create: (_) => ThemeChanger(),
      child: ModularApp(
        module: AppModule(),
        child: const MyApp(),
      ),
    ),
  );
}
