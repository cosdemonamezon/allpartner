import 'package:allpartner/Screen/Login/WelcomeScreen.dart';
import 'package:allpartner/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

import 'Screen/Allpartner/Profile/ProfileController.dart';
import 'Screen/Allpartner/Search/ProductController.dart';
import 'Screen/app/appController.dart';

void main() {
  configLoading();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AppController()),
      ChangeNotifierProvider(create: (_) => ProductController()),
      ChangeNotifierProvider(create: (_) => ProfileController()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontFamily: 'NotoSansThai',
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(),
        ),
        primaryColor: kPrimaryColor,
        backgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'NotoSansThai',
        textSelectionTheme: TextSelectionThemeData(cursorColor: kThemeTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WelcomeScreen(),
    );
  }
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
  // ..customAnimation = CustomAnimation();
}
