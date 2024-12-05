import 'package:flutter/material.dart';
import 'package:news_app_c12_online_sat/core/assets_manager.dart';
import 'package:news_app_c12_online_sat/core/colors_manager.dart';
import 'package:news_app_c12_online_sat/core/constant_manager.dart';
import 'package:news_app_c12_online_sat/core/strings_manager.dart';

class CategoryDM {
  String id;
  String title;
  Color bgColor;
  String imagePath;

  CategoryDM(
      {required this.id,
      required this.title,
      required this.bgColor,
      required this.imagePath});

  static List<CategoryDM> getAllCategories(BuildContext context) => [
        CategoryDM(
            id: ConstantManager.sportsId,
            title: StringsManager.sports(context),
            bgColor: ColorsManager.green,
            imagePath: AssetsManager.sports),
        CategoryDM(
            id: ConstantManager.generalId,
            title: StringsManager.general(context),
            bgColor: ColorsManager.darkBlue,
            imagePath: AssetsManager.general),
        CategoryDM(
            id: ConstantManager.healthId,
            title: StringsManager.health(context),
            bgColor: ColorsManager.pink,
            imagePath: AssetsManager.health),
        CategoryDM(
            id: ConstantManager.businessId,
            title: StringsManager.business(context),
            bgColor: ColorsManager.brown,
            imagePath: AssetsManager.business),
        CategoryDM(
            id: ConstantManager.entertainmentId,
            title: StringsManager.entertainment(context),
            bgColor: ColorsManager.red,
            imagePath: AssetsManager.entertainment),
        CategoryDM(
            id: ConstantManager.scienceId,
            title: StringsManager.science(context),
            bgColor: ColorsManager.yellow,
            imagePath: AssetsManager.science),
        CategoryDM(
            id: ConstantManager.techId,
            title: StringsManager.tech(context),
            bgColor: ColorsManager.green,
            imagePath: AssetsManager.general),
      ];
  static get(){
    print('Hello');
  }
}
