import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/Api/api_constant.dart';
import 'package:news/Model/article_response.dart';
import 'package:news/Model/source_response.dart';
import 'package:news/Providers/AppConfigProvider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ApiManage {

  static Future<SourceResponse?> getSource(String categoryId)async{
     var prefs=await SharedPreferences.getInstance();
    ///https://newsapi.org/v2/top-headlines/sources?apiKey=46d659bda4d546a1881d231e0f16d1a7
    Uri url=Uri.https(ApiConstant.baseUrl,ApiConstant.sourceUrl,{
      'apiKey':"46d659bda4d546a1881d231e0f16d1a7",
      "category":categoryId,
      "language":prefs.getString('language')


    });
 try{
   var response= await http.get(url);
   var bodyString=response.body;
   var json=jsonDecode(bodyString);
   var object=SourceResponse.fromJson(json);
   return object;
 }catch(e){
   throw e;
 }

  }


  static Future<ArticleResponse?> getArticle(String sourceId,String query,String numPage)async{
    var prefs=await SharedPreferences.getInstance();
    ///https://newsapi.org/v2/everything?q=bitcoin&apiKey=46d659bda4d546a1881d231e0f16d1a7
   Uri url=Uri.https(ApiConstant.baseUrl,ApiConstant.articleUrl,{
     'apiKey':'46d659bda4d546a1881d231e0f16d1a7',
     'sources':sourceId,
     'q':query,
     'page':numPage,
     "language":prefs.getString('language')
     // "language":"fr"

     // 'page':'50'
   });
  try{
    var response=await http.get(url);
    var bodyString=response.body;
    var json=jsonDecode(bodyString);
    var object=ArticleResponse.fromJson(json);
    return object;
  }catch(e){
    throw e;
  }
  }
}