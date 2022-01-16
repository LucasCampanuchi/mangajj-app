import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonCardChapter extends StatelessWidget {
  const SkeletonCardChapter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Shimmer.fromColors(
              child: Container(
                width: size.width * 0.25,
                height: size.width * 0.25,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
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
          ),
          const SizedBox(
            height: 7,
          ),
          Shimmer.fromColors(
            child: Container(
              width: size.width * 0.26,
              height: 30,
              decoration: BoxDecoration(
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
          )
        ],
      ),
    );
  }
}
