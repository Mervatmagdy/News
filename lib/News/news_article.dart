import 'package:flutter/material.dart';
import 'package:news/Api/api_manage.dart';
import 'package:news/Model/article_response.dart';
import 'package:news/Model/source_response.dart';
import 'package:news/News/news_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class NewsArticle extends StatefulWidget {
  Sources sourceId;
  NewsArticle({required this.sourceId});

  @override
  State<NewsArticle> createState() => _NewsArticleState();
}

class _NewsArticleState extends State<NewsArticle> {
  int numPage = 1;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManage.getArticle(widget.sourceId.id ?? "", "", numPage.toString()),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Column(
            children: [
              Text("no connection"),
              ElevatedButton(onPressed: () {}, child: Text('Try Again'))
            ],
          );
        } else {
          if (snapshot.data?.status == 'error') {
            return Column(
              children: [
                Text(snapshot.data?.message ?? ""),
                ElevatedButton(onPressed: () {}, child: Text('Try Again'))
              ],
            );
          } else {
            List<Articles> articleList = snapshot.data!.articles!;
            return ListView.builder(
              controller: ScrollController(
                onAttach: (position) {
                  position.addListener(() {
                    if(position.pixels==position.maxScrollExtent ){
                      numPage++;

                      setState(() {

                      });
                    }});

                },
              ),
              itemBuilder: (context, index) {
                return NewsItem(articles: articleList[index]);
              },
              itemCount: articleList.length,
            );
          }
        }
      },
    );
  }
}
