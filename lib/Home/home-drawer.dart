import 'package:flutter/material.dart';
import 'package:news/MyTheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeDrawer extends StatefulWidget {
  Function onClickedDrawer;
  static int settings = 0;

  static int categories = 1;
  HomeDrawer({required this.onClickedDrawer});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          color: MyTheme.primaryColor,
          height: MediaQuery.of(context).size.height * 0.21,
          width: double.infinity,
          child: Center(
              child: Text("${AppLocalizations.of(context)!.news_app_title}!",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: MyTheme.whiteColor),
                  textAlign: TextAlign.center)),
        ),
        InkWell(
          onTap: () {
            widget.onClickedDrawer(HomeDrawer.categories);
          },
          child: Padding(
            padding: EdgeInsets.only(right: 10, left: 10, bottom: 10, top: 20),
            child: Row(
              children: [
                Icon(Icons.list, size: 30),
                SizedBox(
                  width: 10,
                ),
                Text(
                  AppLocalizations.of(context)!.category,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: MyTheme.blackColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            widget.onClickedDrawer(HomeDrawer.settings);
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: [
                Icon(Icons.settings, size: 30),
                SizedBox(
                  width: 10,
                ),
                Text(
                  AppLocalizations.of(context)!.setting,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: MyTheme.blackColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
