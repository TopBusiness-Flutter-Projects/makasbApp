import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:makasb/colors/colors.dart';
import 'package:makasb/constants/app_constant.dart';

class socialWidget extends StatefulWidget {
  const socialWidget({Key? key}) : super(key: key);

  @override
  State<socialWidget> createState() => _socialWidgetState();
}

class _socialWidgetState extends State<socialWidget> {
  @override
  Widget build(BuildContext context) {
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
    return Container(
      padding: EdgeInsets.all(10),
      child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _list.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  border: Border.all(
                    color: AppColors.colorPrimary,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: ExpansionTile(
                  title: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Image.asset(
                        '${AppConstant.localImagePath}insta.png',
                        width: 20.0,
                        height: 20.0,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "Site",
                        style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: AppColors.black),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                    ],
                  ),
                  children: [
                    ListView.builder(
                      itemCount: _list.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            height: 40,
                            margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            decoration: const BoxDecoration(
                              color: AppColors.grey9,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Row(
                              children: [
                                const SizedBox(width: 10),
                                Text(
                                  "Site".tr(),
                                  style: const TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.grey1),
                                ),
                              ],
                            ));
                      },
                    )
                  ],
                  trailing: Transform.rotate(
                      angle:
                          Localizations.localeOf(context).languageCode == 'en'
                              ? 0
                              : 3.14,
                      child: SvgPicture.asset(
                        '${AppConstant.localImagePath}arrow.svg',
                        width: 20.0,
                        height: 20.0,
                      )),
                ),
              );
            },
          )),
    );
  }
}
