import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makasb/models/country_model.dart';

import '../../colors/colors.dart';
import '../../widgets/app_widgets.dart';
import 'cubit/countries_cubit.dart';
import 'cubit/countries_state.dart';

class CountriesPage extends StatefulWidget {
  const CountriesPage({Key? key}) : super(key: key);

  @override
  State<CountriesPage> createState() => _CountriesPageState();
}

class _CountriesPageState extends State<CountriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: Text(
          'Countries'.tr(),
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
    CountriesCubit cubit = BlocProvider.of<CountriesCubit>(context);

    return BlocBuilder<CountriesCubit, CountriesState>(
      builder: (context, state) {
        if (state is IsLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.colorPrimary,
            ),
          );
        } else if (state is OnDataSuccess) {
          return Column(
            children: [buildSearchSection(), buildListSection()],
          );
        } else {
          OnError error = state as OnError;
          return InkWell(
            onTap: (){cubit.getCountries();},
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

  buildSearchSection() {
    double width = MediaQuery.of(context).size.width;
    CountriesCubit cubit = BlocProvider.of<CountriesCubit>(context);

    return Container(
      width: width,
      height: 54,
      margin: const EdgeInsets.all(16.0),
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(27.0),
          color: AppColors.white,
          border: Border.all(color: AppColors.grey3, width: 1.0)),
      child: Row(
        children: [
          AppWidget.svg('search.svg', AppColors.grey6, 24.0, 24.0),
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: TextFormField(
              cursorColor: AppColors.colorPrimary,
              decoration: InputDecoration(
                  hintText: 'search_city'.tr(),
                  hintStyle: TextStyle(fontSize: 15, color: AppColors.grey4),
                  fillColor: AppColors.white,
                  border: InputBorder.none),
              onChanged: (data){
                cubit.search(data);
              },
            ),
          )
        ],
      ),
    );
  }

  buildListSection() {

    CountriesCubit cubit = BlocProvider.of<CountriesCubit>(context);
    String lang = EasyLocalization.of(context)!.locale.languageCode;
    return Expanded(
      child: ListView.builder(
          itemCount: cubit.isSearch?cubit.data.length:cubit.list.length,
          itemBuilder: (context, index) {
            CountryModel model = cubit.isSearch?cubit.data[index]:cubit.list[index];
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
                    Text(lang=='ar'?model.ar_name:model.en_name,maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(color: AppColors.black,fontSize: 15.0),),
                    Transform.rotate(child: AppWidget.svg('arrow.svg', AppColors.black, 24.0, 24.0), angle: lang=='ar'?3.14:0,)
                  ],
                )
              ),
            );
          }),
    );
  }
}
