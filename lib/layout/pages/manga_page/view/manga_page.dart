import 'package:flutter/material.dart';
import 'package:mangajj/layout/pages/manga_page/components/card.dart';
import 'package:mangajj/layout/pages/manga_page/components/card_stack.dart';
import 'package:mangajj/shared/appbar/default_appbar.dart';
import 'package:mangajj/shared/text/text.dart';

class MangaPage extends StatelessWidget {
  const MangaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: DefaultAppBar(
        title: 'Naruto',
        appBar: AppBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: size.width,
              child: Image.asset(
                'assets/image/naruto2.png',
                fit: BoxFit.fitWidth,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 18.0, left: 26.0, right: 26.0),
              child: DeafultText(
                fontSize: 20,
                text:
                    'Whenever Naruto Uzumaki proclaims that he will someday become the Hokage—a title bestowed upon the best ninja in the Village Hidden in the Leaves—no one takes him seriously. Since birth, Naruto has been shunned and ridiculed...',
              ),
            ),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.all(26.0),
                  child: DeafultText(
                    text: 'Capítulos',
                  ),
                ),
              ],
            ),
            Wrap(
              children: const [
                CardChapter(),
                CardChapter(),
                CardChapter(),
                CardChapterStack(),
              ],
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
