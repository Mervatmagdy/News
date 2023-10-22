

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/Model/article_response.dart';
import 'package:news/News/news_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../MyTheme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class NewsContent extends StatefulWidget {
  static const routeName = "news-content";

  @override
  State<NewsContent> createState() => _NewsContentState();
}

class _NewsContentState extends State<NewsContent> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Articles;
    return Container(
      color: MyTheme.whiteColor,
      child: Stack(
        children: [
          Image.asset('assets/pattern.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover),
          Scaffold(
            appBar: AppBar(
              title: Text(
                args.source?.category ?? AppLocalizations.of(context)!.news_app_title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            backgroundColor: Colors.transparent,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.03,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: args.urlToImage ?? "",
                    errorWidget: (context, url, error) => Placeholder(),
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator()),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.sizeOf(context).width * 0.06,
                      vertical: MediaQuery.sizeOf(context).height * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        args.author ?? "",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: MyTheme.geryColor),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        args.title ?? "",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(height: 1.4),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(args.publishedAt ?? "",
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: MyTheme.geryColor,
                                  ),
                          textAlign: TextAlign.end),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        args.content ?? "",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.normal, height: 1.4),
                      ),
                      SizedBox(height: 10,),
                      InkWell(
                        onTap: ()async{
                          Uri uri = Uri.parse(args.url??"");
                          if (await canLaunchUrl(uri)){
                            await launchUrl(uri);
                          } else {
                            throw "can't reach to $uri";
                          }
                          setState(() {

                          });
                        },
                        child: Row(mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("View Full Article",style:Theme.of(context).textTheme.titleSmall!.copyWith(fontSize:17,color:MyTheme.blackColor),),
                            Icon(Icons.arrow_right,size:40,)
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
  // _launchURL() async {
  //   final Uri url = Uri.parse(args.url??"");
  //   if (!await launchUrl(url)) {
  //     throw Exception('Could not launch $url');
  //   }
  // }
}
