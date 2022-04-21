import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';
import 'themes/theme_changer.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeChanger themeChanger = Provider.of<ThemeChanger>(
      context,
      listen: false,
    );
    themeChanger.setInitialTheme();

    return Consumer<ThemeChanger>(
      builder: (context, theme, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Manga JJ',
        theme: theme.getTheme(),
      ).modular(),
    );
  }
}
