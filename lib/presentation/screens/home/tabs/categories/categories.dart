import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_c12_online_sat/config/theme/app_styles.dart';
import 'package:news_app_c12_online_sat/core/strings_manager.dart';
import 'package:news_app_c12_online_sat/data_model/category_DM.dart';
import 'package:news_app_c12_online_sat/presentation/screens/home/tabs/categories/category_widget/category_widget.dart';
typedef OnCategoryClicked = void Function(CategoryDM);
class Categories extends StatelessWidget {
  Categories({super.key, required this.onCategoryClicked});
  OnCategoryClicked onCategoryClicked;


  @override
  Widget build(BuildContext context) {
    List<CategoryDM> categoriesList = CategoryDM.getAllCategories(context);
    return Container(
      padding: REdgeInsets.all(12),
      child: Column(
        children: [
          Text(
            StringsManager.pickCategoryText(context),
            style: AppStyles.pickCategory,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 25,
                crossAxisSpacing: 20,
              ),
              itemCount: categoriesList.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                 onCategoryClicked(categoriesList[index]);
                },
                child: CategoryWidget(
                    categoryDM: categoriesList[index], index: index),
              ),
            ),
          )
        ],
      ),
    );
  }
}
