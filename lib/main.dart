import 'dart:io';
import 'package:probando_flutter/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:probando_flutter/login/login.dart';
import 'package:probando_flutter/login/onboardingScreen/onboarding.dart';
import 'package:probando_flutter/login/splash_screen.dart';
import 'package:probando_flutter/pages/components/tableCalendar.dart';
import 'navigation_home_screen.dart';
import 'package:probando_flutter/vistas/listadoClases.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.portraitUp, DeviceOrientation.portraitDown
  ]).then((_) => runApp(MyApp()));

  
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.grey,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
      title: 'Flutter UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        secondaryHeaderColor: Colors.blueAccent,
        textTheme: AppTheme.textTheme,
        platform: TargetPlatform.iOS,
        fontFamily: 'Quicksand'
      ),
      //home: SplashScreen()
      //home:LoginThreePage()
      home: OnboardingScreen(),
      //home: TableCalendarC(),
     // home: ListadoClases(),
      //home: NavigationHomeScreen(),
    );
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
