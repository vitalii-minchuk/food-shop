import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/small_text.dart';
import 'package:gap/gap.dart';

class IconAndText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  const IconAndText({
    Key? key,
    required this.text,
    required this.icon,
    required this.iconColor,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context){
    return Row(
      children: [
        Icon(icon, color: iconColor,),
        const Gap(5),
        SmallText(text: text)
      ],
    );
  }
}