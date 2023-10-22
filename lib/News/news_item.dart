import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/Model/article_response.dart';
import 'package:news/MyTheme.dart';
import 'package:news/News/news_content.dart';

class NewsItem extends StatefulWidget {
  Articles articles;
  NewsItem({required this.articles});

  @override
  State<NewsItem> createState() => _NewsItemState();
}

class _NewsItemState extends State<NewsItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:10),
      child: InkWell(
        onTap: (){
          Navigator.of(context).pushNamed(NewsContent.routeName,arguments:widget.articles);
          setState(() {
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: widget.articles.urlToImage ?? "",
                errorWidget: (context, url, error) => Placeholder(),
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
              ),
            ),
            SizedBox(height: 10,),
            Text(
              widget.articles.author ?? "",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: MyTheme.geryColor),
            ),
            SizedBox(height: 10,),
            Text(
              widget.articles.title ?? "",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(height: 10,),
            Text(widget.articles.publishedAt ?? "",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: MyTheme.geryColor,
                    ),
                textAlign: TextAlign.end),
            SizedBox(height: 10,),

          ],
        ),
      ),
    );
  }
}
