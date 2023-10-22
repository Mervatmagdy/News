
import 'package:flutter/material.dart';
import 'package:news/Api/api_manage.dart';
import 'package:news/Category/category-fragment.dart';
import 'package:news/Category/category_details.dart';
import 'package:news/Home/home_screen.dart';
import 'package:news/Model/caregory_data.dart';
import 'package:news/MyTheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class SearchCustom extends SearchDelegate<HomeScreen> {



  // CategoryData categoryData;

  @override
  List<Widget>? buildActions(BuildContext context) {
    var categoryList = CategoryData.getCategory(context);
    return [
      IconButton(
          onPressed: () {
            query = '';
            Navigator.pop(context);
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    var categoryList = CategoryData.getCategory(context);
    return IconButton(
        onPressed: () {
          close(context, HomeScreen());
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    var categoryList = CategoryData.getCategory(context);
    for(int i=0;i<categoryList.length;i++){
      if(query.toLowerCase()==categoryList[i].id){
        return  CategoryDetails(categoryId:query);
      }
      }
    return Container(
      child:Center(
        child: Text(AppLocalizations.of(context)!.not_found+"\t"+query,style:Theme.of(context).textTheme.titleMedium!.copyWith(color:MyTheme.geryColor),),
      ),
    );

    }



  @override
  Widget buildSuggestions(BuildContext context) {
    var categoryList = CategoryData.getCategory(context);
    if (query == '') {

      return Container();
    } else {
      var filterList = categoryList
          .where((element) => element.id!.startsWith(query.toLowerCase()))
          .toList();
      return ListView.builder(
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
              query=filterList[index].id??"";
              // searchedCategory(filterList);
              showResults(context);
            },
              child: Card(
                color: MyTheme.whiteColor,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
            filterList[index].title ?? "",
            style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: MyTheme.blueGery),
          ),
                ),
              ));
        },
        itemCount: filterList.length,
      );
    }
    // }else{
    //      return Container(
    //        color:MyTheme.whiteColor,
    //      );}
    // }
  }
}
