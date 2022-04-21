import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mangajj/shared/text/text.dart';
import 'package:provider/provider.dart';

import '../../../themes/theme_changer.dart';

class TitleDefault extends StatelessWidget {
  final String text;

  const TitleDefault({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeChanger themeChanger = Provider.of<ThemeChanger>(context);
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
                color: themeChanger.isDark() ? Colors.white : Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: DefaultText(
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
