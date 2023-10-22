import 'package:flutter/material.dart';
import 'package:news/Api/api_manage.dart';
import 'package:news/Model/source_response.dart';
import 'package:news/News/tab_news.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../MyTheme.dart';

class CategoryDetails extends StatelessWidget {
  static const routeName="category_details";
  String categoryId;
  CategoryDetails({required this.categoryId});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future:ApiManage.getSource(categoryId),
        builder:(context, snapshot) {

          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(
              child:CircularProgressIndicator(),
            );
          }else if(snapshot.hasError){
            return Column(
              children: [
                Text("${snapshot.data?.message??"no connection"}"),
                ElevatedButton(onPressed: (){}, child:Text("Try Again"))
              ],
            );
          } else{
            if(snapshot.data?.status=='error'){
              return Column(
                children: [
                  Text("${snapshot.data?.message}"),
                  ElevatedButton(onPressed: (){}, child:Text("Try Again"))
                ],
              );
            }else {
              var sourceList=snapshot.data!.sources;
              if(sourceList!.isEmpty){
                return Center(child: Text(AppLocalizations.of(context)!.source,style:Theme.of(context).textTheme.titleMedium!.copyWith(color:MyTheme.blueGery),));
              }
              return TabNews(sourceList: sourceList,);
            }
          }
        },);
  }

}
