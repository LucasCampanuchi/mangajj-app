import 'package:flutter/material.dart';
import 'package:mangajj/shared/text/text.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mangajj/themes/theme_changer.dart';
import 'package:provider/provider.dart';
import 'components/list_tile.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeChanger themeChanger = Provider.of<ThemeChanger>(context);
    Size size = MediaQuery.of(context).size;

    return Drawer(
      child: Column(
        children: <Widget>[
          SizedBox(height: size.height * 0.15),
          Expanded(
            child: ListView(
              children: const <Widget>[
                CustomListTile(
                  text: 'Perfil',
                ),
                CustomListTile(
                  text: 'Coleções',
                ),
                CustomListTile(
                  text: 'Alexa Skill',
                )
              ],
            ),
          ),
          SizedBox(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: SizedBox(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: SvgPicture.asset('assets/svg/github.svg'),
                      title: const DefaultText(
                        text: 'Conheça o trabalho',
                        fontSize: 16,
                      ),
                    ),
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child: Icon(Icons.wb_sunny_outlined),
                        ),
                        Switch(
                          value: themeChanger.isDark(),
                          onChanged: (bool value) {
                            themeChanger.setThemeMode(value);
                          },
                          activeTrackColor: Colors.black12,
                          activeColor: Colors.black,
                        ),
                        const Icon(
                          Icons.dark_mode_outlined,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
