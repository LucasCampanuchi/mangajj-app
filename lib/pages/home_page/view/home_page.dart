import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mangajj/pages/home_page/components/card.dart';
import 'package:mangajj/pages/home_page/components/search.dart';
import 'package:mangajj/pages/home_page/components/skeleton_card.dart';
import 'package:mangajj/pages/home_page/components/title.dart';
import 'package:mangajj/pages/home_page/controller/home_page.controller.dart';
import 'package:mangajj/shared/appbar/default_appbar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mangajj/shared/drawer/drawer.dart';
import 'package:mangajj/shared/text/text.dart';
import 'package:mobx/mobx.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = GetIt.I.get<HomePageController>();

  @override
  void initState() {
    controller.search(context: context);

    autorun((r) => print("FOI" + controller.searchText.value.text));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: DefaultAppBar(
        appBar: AppBar(),
        title: "Manga JJ",
      ),
      drawer: const HomeDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            children: [
              SearchBox(),
              const Padding(
                padding: EdgeInsets.only(top: 30.0, bottom: 15),
                child: TitleDefault(
                  text: 'Mangás',
                ),
              ),
              Observer(
                builder: (_) {
                  if (!controller.notSearch) {
                    if (controller.listManga != null) {
                      if (controller.listManga!.isEmpty &&
                          !controller.isSearch) {
                        return const Padding(
                          padding: EdgeInsets.only(top: 50.0, bottom: 50),
                          child:
                              DefaultText(text: 'Nenhum mangá foi encontrado.'),
                        );
                      } else {
                        return Column(
                          children: [
                            Wrap(
                              children: [
                                for (var manga in controller.listManga!)
                                  CardManga(manga: manga)
                              ],
                            ),
                          ],
                        );
                      }
                    } else {
                      return const Padding(
                        padding: EdgeInsets.only(top: 50.0, bottom: 50),
                        child: DefaultText(text: 'Erro ao buscar mangá.'),
                      );
                    }
                  } else {
                    return const Padding(
                      padding: EdgeInsets.only(top: 50.0, bottom: 50),
                      child:
                          DefaultText(text: 'Digite para pesquisar um mangá.'),
                    );
                  }
                },
              ),
              Observer(builder: (_) {
                if (controller.isSearch) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SkeletonCard(),
                      SkeletonCard(),
                    ],
                  );
                } else {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 50.0, bottom: 10.0),
                        child: InkWell(
                          onTap: () {
                            controller.setSumPage(context);
                          },
                          child: const DefaultText(text: 'Ver mais...'),
                        ),
                      )
                    ],
                  );
                }
              }),
              const SizedBox(
                height: 30.0,
              ),
              const TitleDefault(
                text: 'Animes',
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 30.0, right: 30.0, bottom: 20),
                child: SizedBox(
                  height: size.width * 0.20,
                  width: size.width * 0.20,
                  child: SvgPicture.asset(
                    'assets/svg/build.svg',
                  ),
                ),
              ),
              const DefaultText(text: 'Em Construção...'),
              const SizedBox(
                height: 30.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
