import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final String text;
  Color color;
  double size;
  TextOverflow textOverfl;

  BigText({
    Key? key,
    required this.text,
    this.color = const Color(0xFF332d2d),
    this.size = 20,
    this.textOverfl = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Text(
      text,
      maxLines: 1,
      overflow: textOverfl,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.w400,
        fontSize: size,
      )
    );
  }
}