import 'package:flutter/material.dart';
import 'package:mangajj/shared/text/text.dart';

class Reload extends StatelessWidget {
  final double height;
  final String text;
  final Future<void> Function() onRefresh;

  const Reload(
      {Key? key,
      required this.height,
      required this.text,
      required this.onRefresh})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: RefreshIndicator(
        color: Colors.black,
        onRefresh: onRefresh,
        child: ListView.builder(
          itemBuilder: (ctx, idx) {
            return SizedBox(
              height: height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DefaultText(
                    text: text,
                  )
                ],
              ),
            );
          },
          itemCount: 1,
        ),
      ),
    );
  }
}
