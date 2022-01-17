import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mangajj/api/models/manga.model.dart';
import 'package:mangajj/layout/colors.dart';
import 'package:shimmer/shimmer.dart';

class CardManga extends StatefulWidget {
  final Manga manga;
  const CardManga({
    Key? key,
    required this.manga,
  }) : super(key: key);

  @override
  State<CardManga> createState() => _CardMangaState();
}

class _CardMangaState extends State<CardManga> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    UnfocusDisposition disposition = UnfocusDisposition.scope;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            onTap: () {
              setState(() {
                primaryFocus!.unfocus(disposition: disposition);
              });

              Navigator.pushNamed(
                context,
                '/mangapage',
                arguments: {'manga': widget.manga},
              );
            },
            child: Container(
              width: size.width * 0.43,
              height: size.width * 0.43,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: CachedNetworkImage(
                  imageUrl: widget.manga.imageUrl ?? '',
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Shimmer.fromColors(
                    child: Container(
                      width: size.width * 0.43,
                      height: size.width * 0.43,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(30),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                    ),
                    baseColor: Colors.black12,
                    highlightColor: Colors.black26,
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: size.width * 0.35,
          child: Text(
            widget.manga.title ?? '',
            style: GoogleFonts.robotoCondensed(
              textStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: AppColors.textPrimary,
              ),
            ),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
