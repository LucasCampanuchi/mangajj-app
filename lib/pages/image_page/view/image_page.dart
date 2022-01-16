import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mangajj/api/models/manga.model.dart';

class ImagePage extends StatelessWidget {
  final Manga manga;

  const ImagePage({
    Key? key,
    required this.manga,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          manga.title ?? '',
          style: GoogleFonts.robotoCondensed(
            textStyle: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InteractiveViewer(
            clipBehavior: Clip.none,
            panEnabled: true, // Set it to false
            boundaryMargin: const EdgeInsets.all(10),
            minScale: 0.5,
            maxScale: 2,
            child: CachedNetworkImage(
              imageUrl: manga.imageUrl ?? '',
              fit: BoxFit.fitWidth,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ],
      ),
    );
  }
}
