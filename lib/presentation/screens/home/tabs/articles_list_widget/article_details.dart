import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_c12_online_sat/config/theme/app_styles.dart';
import 'package:news_app_c12_online_sat/core/colors_manager.dart';
import 'package:news_app_c12_online_sat/data/api/model/articles_response/article.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleDetails extends StatelessWidget {
  const ArticleDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var article = ModalRoute.of(context)!.settings.arguments as Article;
    return Scaffold(
      backgroundColor: ColorsManager.white,
      appBar: AppBar(
        title: Text(
          'Article Details',
          style: AppStyles.appBar,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 8.h,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: CachedNetworkImage(
                imageUrl: article.urlToImage ?? '',
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                    const Center(child: Icon(Icons.error)),
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
              article.source?.name ?? '',
              style: AppStyles.sourceName,
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(article.title ?? '', style: AppStyles.articleTitle),
            SizedBox(
              height: 4.h,
            ),
            Text(article.publishedAt ?? '',
                textAlign: TextAlign.end, style: AppStyles.publishedAt),
            SizedBox(
              height: 20.h,
            ),
            Text(article.content ?? '',
                style: AppStyles.articleTitle),
            const Spacer(),
            TextButton.icon(
              style: TextButton.styleFrom(alignment: Alignment.bottomRight),
              onPressed: () async{
                await launchUrl( Uri.parse(article.url.toString()));
              },
              icon: Icon(Icons.arrow_right),
              label: Text("View full article"),
              iconAlignment: IconAlignment.end,
            )
          ],
        ),
      ),
    );
  }
}
