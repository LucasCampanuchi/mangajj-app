import 'package:flutter_modular/flutter_modular.dart';
import 'package:mangajj/layout/pages/home_page/view/home_page.dart';

import 'layout/pages/manga_page/view/manga_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const HomePage(),
        ),
        ChildRoute(
          '/mangapage',
          child: (context, args) => const MangaPage(),
        )
      ];
}
