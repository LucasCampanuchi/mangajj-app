import 'package:flutter/material.dart';
import 'package:mangajj/shared/text/text.dart';

class CardChapter extends StatelessWidget {
  const CardChapter({Key? key}) : super(key: key);

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
        const DeafultText(
          text: 'Capítulo #1',
        )
      ],
    );
  }
}
