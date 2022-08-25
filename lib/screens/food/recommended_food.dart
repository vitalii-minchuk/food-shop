import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/recommended_product_controller.dart';
import 'package:flutter_application_1/routes/routeHelper.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/constants.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:flutter_application_1/widgets/app_icon.dart';
import 'package:flutter_application_1/widgets/big_text.dart';
import 'package:flutter_application_1/widgets/expandable_text.dart';
import 'package:get/get.dart';

class RecommendedFood extends StatelessWidget {
  final int pageId;
  const RecommendedFood({ Key? key, required this.pageId }) : super(key: key);

  @override
  Widget build(BuildContext context){
    var product  = Get.find<RecommendedProductController>().recommendedProductList[pageId];
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
                  child: AppIcon(icon: Icons.clear)
                ),
                AppIcon(icon: Icons.shopping_cart_outlined),
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
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30)
                  )
                ),
                child: Center(child: BigText(text: product.name))
              ),
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
                  child: ExpandableText(text: 'Chicken marinated in a spiced yoghurt is placed in a large pot' * 27)
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
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
                AppIcon(
                  icon: Icons.remove,
                  iconColor: Colors.white,
                  size: 50,
                  bgColor: AppColors.mainColor,
                ),
                BigText(text: '\$ ${product.price} X 0'),
                AppIcon(
                  icon: Icons.add,
                  iconColor: Colors.white,
                  size: 50,
                  bgColor: AppColors.mainColor,
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
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.width20,
                vertical: Dimensions.height12,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.mainColor,
              ),
              child: BigText(
                text: '\$10 | Add to cart',
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
        ],
      ),
    );
  }
}