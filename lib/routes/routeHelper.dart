import 'package:flutter_application_1/screens/food/popular_food.dart';
import 'package:flutter_application_1/screens/food/recommended_food.dart';
import 'package:flutter_application_1/screens/home/main_food_page.dart';
import 'package:get/route_manager.dart';

class RouteHelper {
  static const String initial = '/';
  static const String popularFood = '/popular-food';
  static const String recommendedFood = '/recommended-food';

  static String getInitial() => '$initial';
  static String getPopularFood(int pageId) => '$popularFood?pageId=$pageId';
  static String getRecommendedFood(int pageId) => '$recommendedFood?pageId=$pageId';

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => MainFoodPage()),
    GetPage(
      name: popularFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        return PopularFood(pageId: int.parse(pageId!));
      },
      transition: Transition.fadeIn
    ),
    GetPage(
      name: recommendedFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        return RecommendedFood(pageId: int.parse(pageId!));
      },
      transition: Transition.fadeIn
    ),
  ];
}