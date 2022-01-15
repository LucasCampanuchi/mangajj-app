import 'package:flutter/material.dart';
import 'package:mangajj/shared/text/text.dart';

class CustomListTile extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const CustomListTile({
    Key? key,
    required this.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: DefaultText(
        text: text,
      ),
    );
  }
}
