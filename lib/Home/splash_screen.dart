import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news/Home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const routeName='splash_screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState(){
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(Duration(seconds: 2),(){
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    });
  }
  @override
  void dispose(){

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,overlays:SystemUiOverlay.values);
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
          body:
          Image.asset('assets/splash.png',fit: BoxFit.fill,height: double.infinity,width: double.infinity)));
  }
}
