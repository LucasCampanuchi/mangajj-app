import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mangajj/layout/colors.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({Key? key}) : super(key: key);

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
              const Padding(
                padding: EdgeInsets.only(
                  left: 8.0,
                  right: 8.0,
                ),
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: Icon(Icons.search),
                ),
              ),
              SizedBox(
                width: size.width * 0.5,
                child: TextField(
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
