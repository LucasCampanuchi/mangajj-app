import 'package:flutter/material.dart';
import 'package:mangajj/shared/text/text.dart';

class CardManga extends StatelessWidget {
  const CardManga({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            onTap: () => Navigator.pushNamed(context, '/mangapage'),
            child: Container(
              width: size.width * 0.43,
              height: size.width * 0.43,
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
          text: 'Naruto',
        )
      ],
    );
  }
}
