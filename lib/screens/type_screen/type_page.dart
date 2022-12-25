import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../colors/colors.dart';
import '../../models/type.dart';
import '../../widgets/app_widgets.dart';
import 'cubit/type_cubit.dart';
import 'cubit/type_state.dart';

class TypePage extends StatefulWidget {
  const TypePage({Key? key}) : super(key: key);

  @override
  State<TypePage> createState() => _TypePageState();
}

class _TypePageState extends State<TypePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: Text(
          'Type'.tr(),
          style: const TextStyle(
              color: AppColors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.bold),
        ),
        leading: AppWidget.buildBackArrow(context: context),
      ),
      backgroundColor: AppColors.grey2,
      body: buildBodySection(),
    );
  }

  buildBodySection() {
    TypeCubit cubit = BlocProvider.of<TypeCubit>(context);

    return BlocBuilder<TypeCubit, TypeState>(
      builder: (context, state) {
        if (state is IsLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.colorPrimary,
            ),
          );
        }
        else if (state is OnDataSuccess) {
          return Column(
            children: [ buildListSection()],
          );
        } else {
          OnError error = state as OnError;
          return InkWell(
            onTap: (){cubit.getType();},
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppWidget.svg('reload.svg', AppColors.colorPrimary, 24.0, 24.0),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    'reload'.tr(),
                    style:
                        TextStyle(color: AppColors.colorPrimary, fontSize: 15.0),
                  )
                ],
              ),
            ),
          );
        }
      },
    );
  }


  buildListSection() {

    TypeCubit cubit = BlocProvider.of<TypeCubit>(context);
    String lang = EasyLocalization.of(context)!.locale.languageCode;
    return Expanded(
      child: ListView.builder(
          itemCount: cubit.list.length,
          itemBuilder: (context, index) {
            TypeModel model =cubit.list[index];
            return InkWell(
              onTap: (){
                Navigator.pop(context,model);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.symmetric(horizontal: 16.0,vertical: 1),
                color:AppColors.white,
                height: 48,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(lang=='ar'?model.titleAr:model.titleEn,maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(color: AppColors.black,fontSize: 15.0),),
                    Transform.rotate(angle: lang=='ar'?3.14:0,child: AppWidget.svg('arrow.svg', AppColors.black, 24.0, 24.0),)
                  ],
                )
              ),
            );
          }),
    );
  }
}
