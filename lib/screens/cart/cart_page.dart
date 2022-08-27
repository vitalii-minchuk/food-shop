import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/cart_controller.dart';
import 'package:flutter_application_1/screens/home/main_food_page.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/constants.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:flutter_application_1/widgets/app_icon.dart';
import 'package:flutter_application_1/widgets/big_text.dart';
import 'package:flutter_application_1/widgets/small_text.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: Dimensions.height30 * 2,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.arrow_back_ios_new,
                  bgColor: AppColors.mainColor,
                  size: 40,
                  iconColor: Colors.white,
                ),
                SizedBox(
                  width: Dimensions.width20 * 5,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => MainFoodPage());
                  },
                  child: AppIcon(
                    icon: Icons.home_outlined,
                    bgColor: AppColors.mainColor,
                    size: 40,
                    iconColor: Colors.white,
                  ),
                ),
                AppIcon(
                  icon: Icons.shopping_cart,
                  bgColor: AppColors.mainColor,
                  size: 40,
                  iconColor: Colors.white,
                ),
              ],
            ),
          ),
          Positioned(
            top: Dimensions.height20 * 5,
            left: Dimensions.width20,
            right: Dimensions.width20,
            bottom: 0,
            child: Container(
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: GetBuilder<CartController>(
                  builder: (cartController) {
                    return ListView.builder(
                    itemCount: cartController.getItems.length,
                    itemBuilder: (_, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(
                          vertical: Dimensions.height10,
                        ),
                        height: 100,
                        width: double.maxFinite,
                        child: Row(
                          children: [
                            Container(
                              width: Dimensions.width20 * 5,
                              height: Dimensions.height20 * 5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          '${AppConstants.BASE_URL}${AppConstants.UPLOAD_URL}${cartController.getItems[index].img}'))),
                            ),
                            Gap(Dimensions.width10),
                            Expanded(
                              child: Container(
                                height: Dimensions.height20 * 5,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    BigText(
                                      text: cartController.getItems[index].name!,
                                      size: 22,
                                    ),
                                    SmallText(text: 'Spicy'),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        BigText(
                                          text: '\$ ${cartController.getItems[index].price}',
                                          color: Colors.redAccent,
                                          size: 20,
                                        ),
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                // popularProduct.setQuantity(false);
                                              },
                                              child: Icon(
                                                Icons.remove,
                                                color: AppColors.signColor,
                                              ),
                                            ),
                                            Gap(Dimensions.width10),
                                            SmallText(
                                              text: cartController.getItems[index].quantity.toString(),
                                              size: 18,
                                            ),
                                            Gap(Dimensions.width10),
                                            GestureDetector(
                                              onTap: () {
                                                // popularProduct.setQuantity(true);
                                              },
                                              child: Icon(
                                                Icons.add,
                                                color: AppColors.signColor,
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    });
                  },
                )
              ),
            ),
          ),
        ],
      ),
    );
  }
}
