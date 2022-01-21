import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mangajj/layout/colors.dart';
import 'package:mangajj/pages/home_page/controller/home_page.controller.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({Key? key}) : super(key: key);

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  final controller = GetIt.I.get<HomePageController>();
  UnfocusDisposition disposition = UnfocusDisposition.scope;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: size.width * 0.8,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: AppColors.borderBox,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(50),
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  right: 8.0,
                ),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      primaryFocus!.unfocus(disposition: disposition);
                    });
                    controller.setSearchText(null);
                  },
                  child: const SizedBox(
                    width: 40,
                    height: 40,
                    child: Icon(Icons.search),
                  ),
                ),
              ),
              SizedBox(
                width: size.width * 0.6,
                child: TextField(
                  controller: controller.searchText,
                  onChanged: controller.setSearchText,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Pesquisar manga ou anime...',
                    hintStyle: GoogleFonts.robotoCondensed(
                      textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
