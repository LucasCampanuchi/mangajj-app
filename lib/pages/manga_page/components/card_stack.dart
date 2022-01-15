import 'package:flutter/material.dart';
import 'package:mangajj/shared/text/text.dart';

class CardChapterStack extends StatelessWidget {
  const CardChapterStack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            onTap: () => print("manga"),
            child: Container(
              width: size.width * 0.25,
              height: size.width * 0.25,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              child: Image.asset(
                'assets/image/naruto.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        const DefaultText(
          text: 'Capítulo #2',
        )
      ],
    );
  }
}
