import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:flutter_application_1/widgets/big_text.dart';
import 'package:flutter_application_1/widgets/icon_and_text.dart';
import 'package:flutter_application_1/widgets/small_text.dart';
import 'package:gap/gap.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: text),
        const Gap(7),
        Row(
          children: [
            Wrap(
                children: List.generate(
                    5,
                    (index) => Icon(
                          Icons.star,
                          color: AppColors.mainColor,
                          size: 18,
                        ))),
            Gap(Dimensions.height10),
            SmallText(text: '4.5'),
            Gap(Dimensions.height10),
            SmallText(text: '1287'),
            Gap(Dimensions.height10),
            SmallText(text: 'comments'),
          ],
        ),
        Gap(Dimensions.height10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndText(
              text: 'Normal',
              icon: Icons.circle_sharp,
              iconColor: AppColors.iconColor1,
            ),
            IconAndText(
              text: '1.7 km',
              icon: Icons.location_on,
              iconColor: AppColors.mainColor,
            ),
            IconAndText(
              text: '32 min',
              icon: Icons.access_time_filled_rounded,
              iconColor: AppColors.iconColor2,
            ),
          ],
        ),
      ],
    );
  }
}
