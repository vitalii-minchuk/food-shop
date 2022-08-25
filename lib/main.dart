import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/popular_product_controller.dart';
import 'package:flutter_application_1/controllers/recommended_product_controller.dart';
import 'package:flutter_application_1/screens/food/popular_food.dart';
import 'package:flutter_application_1/screens/food/recommended_food.dart';
import 'package:flutter_application_1/screens/home/main_food_page.dart';
import 'package:get/get.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    return GetMaterialApp(
      title: 'Flutter app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const PopularFood(),
      // home: const RecommendedFood(),
      home: const MainFoodPage(),
    );
  }
}
