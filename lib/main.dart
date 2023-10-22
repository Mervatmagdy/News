import 'package:flutter/material.dart';
import 'package:news/Home/splash_screen.dart';
import 'package:news/MyTheme.dart';
import 'package:news/Home/home_screen.dart';
import 'package:news/News/news_content.dart';
import 'package:news/Providers/AppConfigProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await AppConfigProvider.init();
  runApp(ChangeNotifierProvider(create:(context) =>AppConfigProvider(),child: MyApp() ,)
     );
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme:MyTheme.lightTheme,
      locale:Locale(provider.language),
      debugShowCheckedModeBanner:false,
       initialRoute:SplashScreen.routeName ,
      routes:{
        SplashScreen.routeName:(context) => SplashScreen(),
        HomeScreen.routeName:(context) =>HomeScreen(),
        NewsContent.routeName:(context) => NewsContent()
      },
    );
  }
}
