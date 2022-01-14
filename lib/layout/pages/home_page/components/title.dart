import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mangajj/shared/text/text.dart';

class TitleDefault extends StatelessWidget {
  final String text;

  const TitleDefault({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: size.width * 0.8,
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/svg/play.svg',
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: DeafultText(
                  text: text,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
