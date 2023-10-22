import 'package:flutter/material.dart';
import 'package:news/Model/article_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfigProvider extends ChangeNotifier{
  static late SharedPreferences prefs;
  Articles? articles;
  late String language=getLanguage();
  void changeLanguage(String newLanguage){
    if(language==newLanguage){
      return;
    }
    language=newLanguage;
    prefs.setString('language',language);
    notifyListeners();
  }
getLanguage(){
    if(prefs.getString('language')=='en'){
      return 'en';
    }else if(prefs.getString('language')=='ar'){
      return 'ar';

    }else{
      return 'en';
    }
}
static init()async{
    prefs=await SharedPreferences.getInstance();
}
}