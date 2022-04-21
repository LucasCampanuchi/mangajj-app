import 'package:flutter_modular/flutter_modular.dart';
import 'package:mangajj/pages/home_page/view/home_page.dart';
import 'package:mangajj/pages/image_page/view/image_page.dart';
import 'package:mangajj/pages/manga_page/view/manga_page.dart';
import 'package:mangajj/pages/read_page/view/read_page.dart';

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
          child: (context, args) => MangaPage(
            manga: args.data['manga'],
          ),
        ),
        ChildRoute(
          '/imagepage',
          child: (context, args) => ImagePage(
            manga: args.data['manga'],
          ),
        ),
        ChildRoute(
          '/readpage',
          child: (context, args) => ReadPage(
            listChapters: args.data['listChapters'],
            chapter: args.data['chapter'],
            idManga: args.data['idManga'],
          ),
        ),
      ];
}
