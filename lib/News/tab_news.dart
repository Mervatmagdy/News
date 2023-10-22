import 'package:flutter/material.dart';
import 'package:news/MyTheme.dart';
import 'package:news/News/news_article.dart';
import 'package:news/News/tab_custom.dart';
import 'package:news/Model/source_response.dart';

class TabNews extends StatefulWidget {
  List<Sources>? sourceList;

  TabNews({required this.sourceList});

  @override
  State<TabNews> createState() => _TabNewsState();
}

class _TabNewsState extends State<TabNews> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return
      DefaultTabController(
            length: widget.sourceList!.length,
            child: Column(
              children: [
                TabBar(
                    onTap: (index) {
                      selected = index;
                      setState(() {});
                    },
                    isScrollable: true,
                    indicatorColor: Colors.transparent,
                    tabs: widget.sourceList
                        !.map((source) => TabCustom(
                            sources: source,
                            selectedItem:
                                selected == widget.sourceList!.indexOf(source)
                                    ? true
                                    : false))
                        .toList()),
                Expanded(
                    child: NewsArticle(sourceId: widget.sourceList![selected]))
              ],
            ));
  }
}
