import 'package:get_it/get_it.dart';
import 'package:mangajj/controllers/job.controller.dart';
import 'package:mangajj/pages/home_page/controller/home_page.controller.dart';
import 'package:mangajj/pages/manga_page/controller/manga_page.controller.dart';
import 'package:mangajj/pages/read_page/controller/read_page.controller.dart';
import 'package:mangajj/shared/drawer/controller/end_drawer.controller.dart';

Future<void> init() async {
  await mobx();
}

Future<void> mobx() async {
  GetIt getIt = GetIt.I;

  getIt.registerSingleton<JobController>(
    JobController(),
  );
  getIt.registerSingleton<HomePageController>(
    HomePageController(),
  );
  getIt.registerSingleton<MangaPageController>(
    MangaPageController(),
  );
  getIt.registerSingleton<ReadPageController>(
    ReadPageController(),
  );
  getIt.registerSingleton<EndDrawerController>(
    EndDrawerController(),
  );
}
