import 'package:probando_flutter/app_theme.dart';
import 'package:probando_flutter/pages/Inicio.dart';
import 'package:probando_flutter/vistas/components/custom_drawer/drawer_user_controller.dart';
import 'package:probando_flutter/pages/HorarioClases.dart';
import 'package:probando_flutter/vistas/components/custom_drawer/home_drawer.dart';
import 'package:flutter/material.dart';

class NavigationHomeScreen extends StatefulWidget {
  @override
  _NavigationHomeScreenState createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  Widget screenView;
  int drawerIndex;

  @override
  void initState() {
    drawerIndex = 0;
    screenView =  Inicio();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.nearlyWhite,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: AppTheme.nearlyWhite,
          body: DrawerUserController(
            screenIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            onDrawerCall: (int drawerIndexdata) {
              changeIndex(drawerIndexdata);
              //callback from drawer for replace screen as user need with passing DrawerIndex(Enum index)
            },
            screenView: screenView,
            //we replace screen view as we need on navigate starting screens like MyHomePage, HelpScreen, FeedbackScreen, etc...
          ),
        ),
      ),
    );
  }

  void changeIndex(int drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      switch (drawerIndex) {
        case 0:
          setState(() {
            screenView = Inicio();
          });
          break;
        case 1:
          setState(() {
            //screenView =  Inicio();
          });
          break;
        case 2:
          setState(() {
            screenView = const HorarioClases();
          });
          break;
        case 3:
          setState(() {
            //screenView = const HorarioClases();
          });
          break;
        case 4:
          setState(() {
           // screenView = const HorarioClases();
          });
          break;
        default:
      }
      
    }
  }
}
