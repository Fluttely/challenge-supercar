import 'package:flutter/material.dart';

class BoxDetails extends StatelessWidget {
  const BoxDetails({this.title, this.subtitle, Key? key}) : super(key: key);
  final String? title;
  final String? subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title!,
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          subtitle!,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.02,
            fontWeight: FontWeight.w100,
          ),
        ),
      ],
    );
  }
}
