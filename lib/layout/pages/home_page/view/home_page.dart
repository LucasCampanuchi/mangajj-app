import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mangajj/layout/colors.dart';
import 'package:mangajj/layout/pages/home_page/components/card.dart';
import 'package:mangajj/layout/pages/home_page/components/search.dart';
import 'package:mangajj/layout/pages/home_page/components/title.dart';
import 'package:mangajj/shared/appbar/default_appbar.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:mangajj/shared/text/text.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: DefaultAppBar(
        appBar: AppBar(),
        title: "Manga JJ",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            children: [
              const SearchBox(),
              const Padding(
                padding: EdgeInsets.only(top: 30.0, bottom: 15),
                child: TitleDefault(
                  text: 'Mangás',
                ),
              ),
              Wrap(
                children: const [
                  CardManga(),
                  CardManga(),
                ],
              ),
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
              const DeafultText(text: 'Em Construção...')
            ],
          ),
        ),
      ),
    );
  }
}
