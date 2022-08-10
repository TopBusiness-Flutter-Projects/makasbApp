import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:makasb/constants/app_constant.dart';
import 'package:makasb/colors/colors.dart';
import 'package:makasb/widgets/app_widgets.dart';

class addsite_page extends StatefulWidget {
  const addsite_page({Key? key}) : super(key: key);

  @override
  State<addsite_page> createState() => _addsite_pageState();
}

class _addsite_pageState extends State<addsite_page>
    with SingleTickerProviderStateMixin {
  bool isHidden = true;
  bool isSwitched = false;
   String _selectedLocation="";
  File uri = File("");
  List<String> _list = [
   "10","20","30"

  ];
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: true,

      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: false,
        title: Text(
          'adsite'.tr(),
          style: const TextStyle(
              color: AppColors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.bold),
        ),
        leading: AppWidget.buildBackArrow(context: context),
      ),
      backgroundColor: AppColors.white,
      body:
        ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: [
            const SizedBox(
              height: 30,
            ),
            _buildLoginSection(),
          ],
        ),

    );
  }

  _buildLoginSection() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              AppWidget.svg('type.svg', AppColors.colorPrimary, 15.0, 15.0),
              const SizedBox(width: 5), // give it width

              Text(
                'Type'.tr(),
                style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                    color: AppColors.black),
              )
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
          Container(
              height: 56.0,

              decoration: BoxDecoration(
                  color: AppColors.grey8,
                  borderRadius: BorderRadius.circular(16.0)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: DropdownButton(
                  underline: Container(),
                  isExpanded: true,
                  hint:Text("select".tr()),
                  items:_list.map((item) {
                    return  DropdownMenuItem<String>(
                      child:  Text(item),
                      value: item,

                    );
                  }).toList(),
                  onChanged: ( value  ) {
                    setState(() {
                      _selectedLocation =value.toString() ;
                    });

                  },
                    value: _selectedLocation.isNotEmpty ? _selectedLocation : null,
                ),
              )),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            children: [
              AppWidget.svg('world.svg', AppColors.colorPrimary, 15.0, 15.0),
              const SizedBox(width: 5), // give it width

              Text(
                'Country'.tr(),
                style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                    color: AppColors.black),
              )
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
          Container(
              height: 56.0,

              decoration: BoxDecoration(
                  color: AppColors.grey8,
                  borderRadius: BorderRadius.circular(16.0)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: DropdownButton(
                  underline: Container(),
                  isExpanded: true,
                  hint:Text("select".tr()),
                  items:_list.map((item) {
                    return  DropdownMenuItem<String>(
                      child:  Text(item),
                      value: item,

                    );
                  }).toList(),
                  onChanged: ( value  ) {
                    setState(() {
                      _selectedLocation =value.toString() ;
                    });

                  },
                  value: _selectedLocation.isNotEmpty ? _selectedLocation : null,
                ),
              )),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            children: [
              AppWidget.svg('title_page.svg', AppColors.colorPrimary, 15.0, 15.0),
              const SizedBox(width: 5), // give it width

              Text(
                'set title for site - page'.tr(),
                style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                    color: AppColors.black),
              )
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
          Container(
              height: 56.0,
              decoration: BoxDecoration(
                  color: AppColors.grey8,
                  borderRadius: BorderRadius.circular(16.0)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: TextFormField(
                  maxLines: 1,
                  autofocus: false,
                  cursorColor: AppColors.colorPrimary,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'email'.tr(),
                      hintStyle: const TextStyle(
                          color: AppColors.grey1, fontSize: 14.0)),
                ),
              )),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            children: [
              AppWidget.svg('file.svg', AppColors.colorPrimary, 15.0, 15.0),
              const SizedBox(width: 5), // give it width

              Text(
                'page url'.tr(),
                style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                    color: AppColors.black),
              )
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
          Container(
              height: 56.0,
              decoration: BoxDecoration(
                  color: AppColors.grey8,
                  borderRadius: BorderRadius.circular(16.0)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: TextFormField(
                  maxLines: 1,
                  autofocus: false,
                  cursorColor: AppColors.colorPrimary,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'email'.tr(),
                      hintStyle: const TextStyle(
                          color: AppColors.grey1, fontSize: 14.0)),
                ),
              )),
          const SizedBox(
            height: 8.0,
          ),
          Row(
            children: [
              AppWidget.svg('hand_click.svg', AppColors.colorPrimary, 15.0, 15.0),
              const SizedBox(width: 5), // give it width

              Text(
                'Total clicks limit'.tr(),
                style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                    color: AppColors.black),
              ),
              Expanded(child: Container(),flex: 1,),
              Switch(
                value: isSwitched,

                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                    print(isSwitched);
                  });
                },
                activeTrackColor: AppColors.colorPrimary,
                activeColor:AppColors.colorPrimary,
              )            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
         Row(
           children: [
             const SizedBox(width: 10,),
             Text(
               'limit'.tr(),
               style: const TextStyle(
                   fontSize: 16.0,
                   fontWeight: FontWeight.normal,
                   color: AppColors.black),
             ),
             const SizedBox(width: 10,),
         Expanded(flex: 1,child:Container(
             height: 56.0,
             decoration: BoxDecoration(
                 color: AppColors.grey8,
                 borderRadius: BorderRadius.circular(16.0)),
             child: Padding(
               padding:  EdgeInsets.symmetric(horizontal: 12.0),
               child: TextFormField(
                 maxLines: 1,
                 autofocus: false,
                 cursorColor: AppColors.colorPrimary,
                 keyboardType: TextInputType.emailAddress,
                 textInputAction: TextInputAction.next,
                 decoration: InputDecoration(
                     border: InputBorder.none,
                     hintText: '1000',
                     hintStyle: const TextStyle(
                         color: AppColors.grey1, fontSize: 14.0)),
               ),
             )),)

           ],)
          ,
          const SizedBox(
            height: 8.0,
          ),
          Row(
            children: [
              AppWidget.svg('hand_click.svg', AppColors.colorPrimary, 15.0, 15.0),
              const SizedBox(width: 5), // give it width

              Text(
                'Daily clicks limit'.tr(),
                style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                    color: AppColors.black),
              ),
              Expanded(child: Container(),flex: 1,),
              Switch(
                value: isSwitched,

                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                    print(isSwitched);
                  });
                },
                activeTrackColor: AppColors.colorPrimary,
                activeColor:AppColors.colorPrimary,
              )            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
          Row(
            children: [
              const SizedBox(width: 10,),
              Text(
                'limit'.tr(),
                style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                    color: AppColors.black),
              ),
              const SizedBox(width: 10,),
              Expanded(flex: 1,child:Container(
                  height: 56.0,
                  decoration: BoxDecoration(
                      color: AppColors.grey8,
                      borderRadius: BorderRadius.circular(16.0)),
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 12.0),
                    child: TextFormField(
                      maxLines: 1,
                      autofocus: false,
                      cursorColor: AppColors.colorPrimary,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '1000',
                          hintStyle: const TextStyle(
                              color: AppColors.grey1, fontSize: 14.0)),
                    ),
                  )),)

            ],)
          ,
          const SizedBox(
            height: 8.0,
          ),
          Row(
            children: [
              AppWidget.svg('hand_dolar.svg', AppColors.colorPrimary, 15.0, 15.0),
              const SizedBox(width: 5), // give it width

              Text(
                'Cost/Points Per Click (from 5 to 50)'.tr(),
                style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                    color: AppColors.black),
              )
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
          Container(
              height: 56.0,
              decoration: BoxDecoration(
                  color: AppColors.grey8,
                  borderRadius: BorderRadius.circular(16.0)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: TextFormField(
                  maxLines: 1,
                  autofocus: false,
                  cursorColor: AppColors.colorPrimary,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'email'.tr(),
                      hintStyle: const TextStyle(
                          color: AppColors.grey1, fontSize: 14.0)),
                ),
              )),
          const SizedBox(
            height: 20.0,
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
            child: Text('login'.tr()),
          ),

        ],
      ),
    );
  }

  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      setState(() {
        uri = imageFile;
      });
    }
  }
}
