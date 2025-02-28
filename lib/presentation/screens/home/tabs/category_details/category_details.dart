import 'package:flutter/material.dart';
import 'package:news_app_c12_online_sat/data/api/api_manager/api_manager.dart';
import 'package:news_app_c12_online_sat/data/api/model/articles_response/article.dart';
import 'package:news_app_c12_online_sat/data/api/model/sources_response/source.dart';
import 'package:news_app_c12_online_sat/data/api/model/sources_response/sources_response.dart';
import 'package:news_app_c12_online_sat/data_model/category_DM.dart';
import 'package:news_app_c12_online_sat/presentation/screens/home/tabs/category_details/widgets/category_details_viewModel.dart';
import 'package:news_app_c12_online_sat/presentation/screens/home/tabs/category_details/widgets/sources_tab_widget/sources_tab_widget.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatefulWidget {
  CategoryDetails({super.key, required this.categoryDM});

  CategoryDM categoryDM;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  var viewModel = CategoryDetailsViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSourcesByCategoryId(widget.categoryDM.id);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: viewModel,
        child: Consumer<CategoryDetailsViewModel>(
          builder: (context, value, child) {
            if (viewModel.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (viewModel.errorMessage != null) {
              return Center(
                child: Text(viewModel.errorMessage!),
              );
            }
            return SourcesTabWidget(sources: viewModel.sources!);
          },
        ));
  }
}
