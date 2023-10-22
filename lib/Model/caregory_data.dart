import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:news/MyTheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class CategoryData{

  String? id;
  String? title;
  Color? color;
  String? image;
  CategoryData({required this.id,required this.title,required this.color,required this.image});
  ///business entertainment general health science sports technology
 static List<CategoryData> getCategory(BuildContext context){
  return[
    CategoryData(id:'business', title:AppLocalizations.of(context)!.business, color:MyTheme.orangeColor, image:"assets/bussines.png",),
    CategoryData(id:'entertainment', title:AppLocalizations.of(context)!.entertainment, color:MyTheme.blueColor, image:"assets/Politics.png"),
    CategoryData(id:'general', title: AppLocalizations.of(context)!.general, color:MyTheme.blueDark, image:"assets/environment.png",),
    CategoryData(id:'health', title: AppLocalizations.of(context)!.health, color:MyTheme.pinkColor, image:"assets/health.png",),
    CategoryData(id:'science', title: AppLocalizations.of(context)!.science, color:MyTheme.yellowColor, image:"assets/science.png"),
    CategoryData(id:'sports', title: AppLocalizations.of(context)!.sports, color:MyTheme.redColor, image:"assets/ball.png"),
    CategoryData(id:'technology', title: AppLocalizations.of(context)!.technology, color:MyTheme.blueGeryDark, image:"assets/science.png",),
  ];
}
}