import 'package:flutter/material.dart';
import 'package:news_app_c12_online_sat/config/theme/app_theme.dart';
import 'package:news_app_c12_online_sat/core/colors_manager.dart';
import 'package:news_app_c12_online_sat/data/api/api_manager/api_manager.dart';
import 'package:news_app_c12_online_sat/data/api/model/articles_response/ArticlesResponse.dart';
import 'package:news_app_c12_online_sat/data/api/model/articles_response/article.dart';
import 'package:news_app_c12_online_sat/presentation/screens/home/tabs/articles_list_widget/article_item_widget.dart';

class SearchResults extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: AppTheme.light.appBarTheme,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: ColorsManager.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          onPressed: () {
            FocusScope.of(context).unfocus();
            buildResults(context);
          },
          icon: Icon(Icons.search))
    ];
    //throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.clear));
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.searchForArticles(query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text("Error Occured"),
            );
          }
          if (!snapshot.hasData) {
            return Center(
              child: Text("Not Found"),
            );
          }

          var articlesResponse = snapshot.data as ArticlesResponse;
          if (articlesResponse.articles == null ||
              articlesResponse.articles!.length == 0) {
            return Center(
              child: Text("Not Found"),
            );
          } else {
            return ListView.builder(
              itemBuilder: (context, index) =>
                  ArticleItemWidget(article: articlesResponse.articles![index]),
              itemCount: articlesResponse.articles!.length ?? 0,
            );
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.searchForArticles(query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text("Error Occured"),
            );
          }
          if (!snapshot.hasData) {
            return Center(
              child: Text("Not Found"),
            );
          }

          var articlesResponse = snapshot.data as ArticlesResponse;
          if (articlesResponse.articles == null ||
              articlesResponse.articles!.length == 0) {
            return Center(
              child: Text("Not Found"),
            );
          } else {
            return ListView.builder(
              itemBuilder: (context, index) =>
                  ArticleItemWidget(article: articlesResponse.articles![index]),
              itemCount: articlesResponse.articles!.length ?? 0,
            );
          }
        });
  }
}
