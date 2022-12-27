import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:html/dom.dart' as dom;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../colors/colors.dart';
import '../../../../models/slider.dart';
import '../../../../widgets/app_widgets.dart';

class AddScreenWidget extends StatefulWidget {
  final List<SliderModel> sliderModel;

  const AddScreenWidget({Key? key, required this.sliderModel})
      : super(key: key);

  @override
  State<AddScreenWidget> createState() =>
      _AddScreenWidgetState(sliderModel: sliderModel);
}

class _AddScreenWidgetState extends State<AddScreenWidget> {
  final List<SliderModel> sliderModel;
  int index1 = 0;

  _AddScreenWidgetState({required this.sliderModel});

  @override
  Widget build(BuildContext context) {
    String lang = EasyLocalization.of(context)!.locale.languageCode;

    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      color: AppColors.grey3,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: AppColors.grey4,
            height: 1.0,
          ),
          Container(
            color: AppColors.grey3,
            padding: const EdgeInsets.only(top: 8.0),
            child: CarouselSlider(
              items: List.generate(
                  sliderModel.length,
                  (index) => ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                const Color(0xFF008BD2),
                                const Color(0xFF00D2D2),
                              ],
                              begin: const FractionalOffset(0.0, 0.0),
                              end: const FractionalOffset(1.0, 0.0),
                              stops: [0.0, 1.0],
                              tileMode: TileMode.clamp),
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: ListView(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Center(
                                    child: sliderModel[index]
                                            .image!
                                            .contains('svg')
                                        ? SvgPicture.network(
                                            sliderModel[index].image!,
                                            height: 30,
                                            width: 30,
                                          )
                                        :
                                    CachedNetworkImage(
                                            height: 30,
                                            imageUrl: sliderModel[index].image!,
                                            placeholder: (context, url) =>
                                                Container(
                                                  color: AppColors.grey2,
                                                ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Container(
                                                      color: AppColors.grey2,
                                                    )),
                                  ),
                                  Expanded(
                                    child: Html(
                                      data: lang == 'ar'
                                          ? sliderModel[index].descAr
                                          : sliderModel[index].descEn,
                                      style: {
                                        "body": Style(
                                            fontSize: FontSize(14.0),
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.white)
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  )
                                ],
                              ),
                            ),
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: AppColors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    elevation: 5,
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    ' ${lang == 'ar' ? sliderModel[index].btnTitleAr : sliderModel[index].btnTitleEn}',
                                    style: TextStyle(
                                      color: AppColors.colorPrimary,
                                      fontSize: 12,
                                    ),
                                  ),
                                )),
                            SizedBox(
                              height: 8,
                            )
                          ],
                        ),
                      ))),
              options: CarouselOptions(
                onPageChanged: (index, reason) {
                  setState(() {
                    index1 = index;
                  });
                },
                autoPlay: true,
                enableInfiniteScroll: sliderModel.length > 1 ? true : false,
                viewportFraction: sliderModel.length > 1 ? 0.9 : 1,
                scrollDirection: Axis.horizontal,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                initialPage: 0,
                autoPlayInterval: const Duration(seconds: 4),
                enlargeCenterPage: true,
              ),
            ),
          ),
          AnimatedSmoothIndicator(
            count: sliderModel.length,
            effect: const ExpandingDotsEffect(expansionFactor: 2),
            activeIndex: index1,
            // your preferred effect
          ),
        ],
      ),
    );
  }
}
