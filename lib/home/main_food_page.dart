import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/colors.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({ Key? key }) : super(key: key);

  @override
  _MainFoodPageState createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    'Country'
                  ),
                  Text(
                    'Sity'
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
                child: Icon(
                  Icons.search_rounded,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
        ]
      ),
    );
  }
}