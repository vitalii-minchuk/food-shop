import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:flutter_application_1/widgets/app_column.dart';
import 'package:flutter_application_1/widgets/big_text.dart';
import 'package:flutter_application_1/widgets/icon_and_text.dart';
import 'package:flutter_application_1/widgets/small_text.dart';
import 'package:gap/gap.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  _FoodPageBodyState createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = 220;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: Dimensions.pageView,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
        ),
        DotsIndicator(
          dotsCount: 5,
          position: _currPageValue,
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
        Gap(Dimensions.height30),
        Container(
          margin: EdgeInsets.symmetric(horizontal: Dimensions.width20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: 'Popular'),
              Gap(Dimensions.width10),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: SmallText(
                  text: '.',
                  size: 20,
                ),
              ),
              Gap(Dimensions.width10),
              Container(
                  margin: const EdgeInsets.only(bottom: 2),
                  child: SmallText(text: 'Food pairing')),
            ],
          ),
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(
                horizontal: Dimensions.width20,
                vertical: 5,
              ),
              child: Row(
                children: [
                  Container(
                    width: Dimensions.listViewImgWidth,
                    height: Dimensions.listViewImgHeight,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white38,
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/food_3.jpg'))),
                  ),
                  Expanded(
                    child: Container(
                      height: Dimensions.listViewInfoHeight,
                      padding: const EdgeInsets.all(7),
                      decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.horizontal(right: Radius.circular(10)),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(7),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BigText(text: 'Nutritious fruit meal in China'),
                            SmallText(text: 'With chinese characteristics'),
                            FittedBox(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 1);
    }
    return Transform(
      transform: matrix,
      child: Stack(children: [
        Container(
          height: Dimensions.pageViewContainer,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: index.isEven
                  ? const Color(0xFF69c5df)
                  : const Color(0xFF9294cc),
              image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/food_2.jpg'))),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: Dimensions.pageViewTextContainer,
            margin: EdgeInsets.only(
              right: 30,
              left: 30,
              bottom: Dimensions.height20,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    offset: const Offset(0, 5),
                    blurRadius: 3,
                  ),
                  const BoxShadow(
                    color: Colors.white,
                    offset: Offset(5, 0),
                    blurRadius: 3,
                  ),
                  const BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, 0),
                    blurRadius: 3,
                  ),
                ]),
            child: Container(
              padding: const EdgeInsets.all(12),
              child: const AppColumn(),
            ),
          ),
        ),
      ]),
    );
  }
}
