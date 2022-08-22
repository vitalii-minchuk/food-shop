import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home/food_page_body.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/widgets/big_text.dart';
import 'package:flutter_application_1/widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  _MainFoodPageState createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          margin: const EdgeInsets.only(top: 45, bottom: 15),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  BigText(
                    text: 'Ukraine',
                    color: AppColors.mainColor,
                  ),
                  Row(
                    children: [
                      SmallText(
                        text: 'Odessa',
                        color: AppColors.mainBlackColor,
                      ),
                      const Icon(
                        Icons.arrow_drop_down_rounded
                      )
                    ],
                  ),
                ],
              ),
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.mainColor,
                ),
                child: const Icon(
                  Icons.search_rounded,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
        const Expanded(
          child: SingleChildScrollView(child: FoodPageBody())
        ),
      ]),
    );
  }
}
