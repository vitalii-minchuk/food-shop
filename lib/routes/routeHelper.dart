import 'package:flutter_application_1/screens/food/popular_food.dart';
import 'package:flutter_application_1/screens/home/main_food_page.dart';
import 'package:get/route_manager.dart';

class RouteHelper {
  static const String initial = '/';
  static const String popularFood = '/popular-food';

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => MainFoodPage()),
    GetPage(name: popularFood, page: () => PopularFood()),
  ];
}