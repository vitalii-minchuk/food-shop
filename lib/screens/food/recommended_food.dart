import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/cart_controller.dart';
import 'package:flutter_application_1/controllers/popular_product_controller.dart';
import 'package:flutter_application_1/controllers/recommended_product_controller.dart';
import 'package:flutter_application_1/routes/routeHelper.dart';
import 'package:flutter_application_1/screens/cart/cart_page.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/constants.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:flutter_application_1/widgets/app_icon.dart';
import 'package:flutter_application_1/widgets/big_text.dart';
import 'package:flutter_application_1/widgets/expandable_text.dart';
import 'package:get/get.dart';

class RecommendedFood extends StatelessWidget {
  final int pageId;
  const RecommendedFood({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            automaticallyImplyLeading: false,
            toolbarHeight: 90,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.initial);
                    },
                    child: AppIcon(icon: Icons.clear)),
                GetBuilder<PopularProductController>(builder: (controller) {
                  return Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(() => CartPage());
                        },
                        child: AppIcon(icon: Icons.shopping_cart_outlined)
                      ),
                      Get.find<PopularProductController>().totalItems > 0
                          ? Positioned(
                              right: 0,
                              top: 0,
                              child: AppIcon(
                                icon: Icons.circle,
                                size: 20,
                                iconColor: Colors.transparent,
                                bgColor: AppColors.mainColor,
                              ),
                            )
                          : Container(),
                      Get.find<PopularProductController>().totalItems > 0
                          ? Positioned(
                              right: Get.find<PopularProductController>()
                                          .totalItems > 9
                                  ? 2
                                  : 6,
                              top: 2,
                              child: BigText(
                                text: Get.find<PopularProductController>()
                                    .totalItems
                                    .toString(),
                                size: 14,
                                color: Colors.white,
                              ))
                          : Container(),
                    ],
                  );
                }),
                // AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: Dimensions.height10,
                  ),
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(30))),
                  child: Center(child: BigText(text: product.name))),
            ),
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                '${AppConstants.BASE_URL}${AppConstants.UPLOAD_URL}${product.img}',
                fit: BoxFit.cover,
                width: double.maxFinite,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.width20,
                    ),
                    child: ExpandableText(
                        text:
                            'Chicken marinated in a spiced yoghurt is placed in a large pot' *
                                27)),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(
        builder: ((controller) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.width20 * 2.5,
                  vertical: Dimensions.height10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.setQuantity(false);
                      },
                      child: AppIcon(
                        icon: Icons.remove,
                        iconColor: Colors.white,
                        size: 50,
                        bgColor: AppColors.mainColor,
                      ),
                    ),
                    BigText(
                        text:
                            '\$ ${product.price} X ${controller.inCartItems}'),
                    GestureDetector(
                      onTap: () {
                        controller.setQuantity(true);
                      },
                      child: AppIcon(
                        icon: Icons.add,
                        iconColor: Colors.white,
                        size: 50,
                        bgColor: AppColors.mainColor,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 110,
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.width20,
                  vertical: Dimensions.height15,
                ),
                decoration: BoxDecoration(
                    color: AppColors.buttonBGColor,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(30),
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.width20,
                        vertical: Dimensions.height12,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Icon(
                        Icons.favorite,
                        color: AppColors.mainColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.addItem(product);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.width20,
                          vertical: Dimensions.height12,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.mainColor,
                        ),
                        child: BigText(
                          text: '\$${product.price} | Add to cart',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
