import 'dart:async';
import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;
import 'package:makasb/colors/colors.dart';
import 'package:makasb/constants/app_constant.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class coinsWidget extends StatefulWidget {
  const coinsWidget({Key? key}) : super(key: key);

  @override
  State<coinsWidget> createState() => _coinsWidgetState();
}

class _coinsWidgetState extends State<coinsWidget>
    with SingleTickerProviderStateMixin {
  double _currentPage = 0;
  List<int> _list = [
    10,
    20,
    30,
    40,
    50,
    10,
    20,
    30,
    40,
    50,
    10,
    20,
    30,
    40,
    50
  ];
  late Timer _timer;
  PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 10) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage.toInt(),
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(children: [
        const SizedBox(height: 10),
        Row(
          children: [
            Transform.rotate(
                angle: Localizations.localeOf(context).languageCode == 'en'
                    ? 0
                    : 3.14,
                child: Image.asset(
                  '${AppConstant.localImagePath}rectangle.png',
                  width: 20.0,
                  height: 40.0,
                )),
            Text(
              "top_social_media".tr(),
              style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black),
            ),
          ],
        ),
        Container(
            constraints: const BoxConstraints.expand(height: 260),
            child: _imageSlider(context)),
        SmoothPageIndicator(
          controller: _pageController, // PageController
          count: 10,
          effect: const ExpandingDotsEffect(
              expansionFactor: 2), // your preferred effect
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Transform.rotate(
                angle: Localizations.localeOf(context).languageCode == 'en'
                    ? 0
                    : 3.14,
                child: Image.asset(
                  '${AppConstant.localImagePath}rectangle.png',
                  width: 20.0,
                  height: 40.0,
                )),
            Text(
              "top_social_media".tr(),
              style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black),
            ),
          ],
        ),
        LayoutBuilder(
            builder: (context, constraints) => GridView.builder(
                  shrinkWrap: true,
                  itemCount: _list.length,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: constraints.maxWidth > 700 ? 4 : 2,
                    childAspectRatio: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Expanded(
                        child: InkWell(
                            child: Container(
                              alignment: Alignment.center,
                              decoration:  BoxDecoration(
                                  border: Border.all(color: AppColors.grey5),
                                  color: AppColors.white,

                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(0),
                                      bottomLeft: Radius.circular(15),
                                      topRight: Radius.circular(15),
                                      bottomRight: Radius.circular(0))),
                              child: Column(
                                children: [
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "\$",
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.grey5),
                                      ),
                                      Text(
                                        "5".tr(),
                                        style: const TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.colorPrimary),
                                      )
                                    ],
                                  ),
                                  Text(
                                    "5000".tr(),
                                    style: const TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.colorPrimary),
                                  ),
                                  Text(
                                    "point".tr(),
                                    style: const TextStyle(
                                        fontSize: 20.0, color: AppColors.grey1),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "buy".tr(),
                                    style: const TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.red),
                                  )
                                ],
                              ),
                            )));
                  },
                )),
        const SizedBox(height: 10),
      ]),
    );
  }

  _imageSlider(context) {
    return PageView.builder(
      controller: _pageController,
      itemBuilder: (BuildContext context, int index) {
        return Container(
            margin: const EdgeInsets.all(10),
            child: Card(
              child: Container(
                child: Column(
                  children: [
                    Html(
                      data: """
                <div>Follow<a class='sup'><sup>pl</sup></a>
                  Below hr
                    <b>Bold</b>
                <h1>what was sent down to you from your Lord</h1>,
                and do not follow other guardians apart from Him. Little do
                <span class='h'>you remind yourselves</span><a class='f'><sup f=2437>1</sup></a></div>
                """,
                      onImageError: (node, children) {
                        if (node is dom.Element) {
                          switch (node.localName) {
                            case "custom_tag": // using this, you can handle custom tags in your HTML
                            // return Column(children: children);
                          }
                        } else {}
                      },
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: AppColors.colorPrimary,
                          elevation: 5,
                          shadowColor: AppColors.grey8),
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(AppConstant.pageHomeRoute);
                      },
                      child: Text('buy now'.tr()),
                    ),
                  ],
                ),
              ),
            ));
      },
      itemCount: 10,
    );
  }
}
