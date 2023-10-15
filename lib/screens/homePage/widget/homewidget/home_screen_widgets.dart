import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

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
  StreamController<int> valueController = StreamController();

  _AddScreenWidgetState({required this.sliderModel});

  @override
  Widget build(BuildContext context) {
    String lang = EasyLocalization.of(context)!.locale.languageCode;
    valueController.add(0);
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

                              child: Container(
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
                                          : CachedNetworkImage(
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
                                    HtmlWidget(

                                       lang == 'ar'
                                            ? sliderModel[index].descAr!
                                            : sliderModel[index].descEn!,
                                      textStyle: TextStyle(fontWeight: FontWeight.bold,
                                          color: AppColors.white)
                                      ),

                                    SizedBox(
                                      height: 20,
                                    )
                                  ],
                                ),
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
                                  onPressed: () {
                                    _openSocialUrl(
                                        url: sliderModel[index].btnLink!);
                                  },
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
                  index1 = index;
                  valueController.add(index1);
                },
                autoPlay: true,
                enableInfiniteScroll: sliderModel.length > 1 ? true : false,
                viewportFraction: sliderModel.length > 1 ? 0.9 : 1,
                scrollDirection: Axis.horizontal,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                initialPage: 0,
                autoPlayInterval: const Duration(seconds: 10),
                enlargeCenterPage: true,
              ),
            ),
          ),
          SizedBox(height: 2,),
          dots()
        ],
      ),
    );
  }

  void _openSocialUrl({required String url}) async {
    Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri,
          webViewConfiguration: const WebViewConfiguration(
              enableJavaScript: true, enableDomStorage: true));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'invalidUrl'.tr(),
          style: const TextStyle(fontSize: 18.0),
        ),
        backgroundColor: AppColors.colorPrimary,
        elevation: 8.0,
        duration: const Duration(seconds: 3),
      ));
    }
  }

 Widget dots() {
  return  StreamBuilder(
        stream: valueController.stream,
        builder: (context, snapshot) {
          Object? value = snapshot.data;
          return AnimatedSmoothIndicator(
              count: sliderModel.length,
              effect: const ExpandingDotsEffect(expansionFactor: 2),
              activeIndex: int.parse(value!=null?value.toString():"0"));
        });
  }
}
