import 'package:flutter/material.dart';
import 'package:probando_flutter/login/onboardingScreen/onboarding.dart';
import 'dart:async';
import 'package:probando_flutter/navigation.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkSessionAuth().then(
    (value) 
    {
      //_navigateHome(value?"home":"presentationApp");
    //  _navigateHome("home");
    }
  );
  }

  Future<bool> _checkSessionAuth() async {
    await Future.delayed(Duration(milliseconds: 5000), () {});
    return true; //cambiar por si está auth
  }

  void _navigateHome(String route) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) => OnboardingScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
               image: DecorationImage(
                image: AssetImage("assets/images/wallpaper.jpg"),
                fit: BoxFit.cover,
              ),
              /*gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.red,Colors.redAccent, Colors.white]
              )*/
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50.0,
                        child: Container(
                          width: 70,
                          child: Image.asset('assets/images/lgsoftware.png'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      Text("AulaVirtual",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'MuseoModerno'))
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("LGSoftwareweb.com",
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color:Colors.white,fontFamily: 'QuickSand'
                      ),
                    ),
                    SizedBox(height: 20,),
                    CircularProgressIndicator(
                      valueColor:
                          new AlwaysStoppedAnimation<Color>(Colors.white),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
