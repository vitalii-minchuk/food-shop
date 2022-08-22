import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/app_column.dart';
import 'package:flutter_application_1/widgets/app_icon.dart';

class PopularFood extends StatelessWidget {
const PopularFood({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: 350,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/images/food_1.jpg'
                  )
                )
              ),
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            top: 45,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                AppIcon(icon: Icons.arrow_back_ios_new_rounded),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 325,
            child: Container(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              child: const AppColumn(),
            ),
          )
        ],
      ),
    );
  }
}