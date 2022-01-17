import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonCard extends StatelessWidget {
  const SkeletonCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Shimmer.fromColors(
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
        ),
        const SizedBox(
          height: 7,
        ),
        Shimmer.fromColors(
          child: Container(
            width: size.width * 0.29,
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
    );
  }
}
