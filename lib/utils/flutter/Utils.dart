import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'dart:math';
import 'package:sweetalert/sweetalert.dart';

class Utils {
  void cerrarDialogGlobal(BuildContext context) {
    Navigator.of(context).pop();
  }

  void dialogLoadingData(
      IconData icon, Color color, String msj, BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext bc) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                height: 180,
                width: 80,
                decoration: BoxDecoration(
                    // borderRadius: BorderRadius.all(Radius.circular(20))
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    ColorLoader3(),
                    Text(msj, style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                    )
                  ],
                )),
          );
        });
  }

  Future<bool> showDialogQuestion(BuildContext context, String title,
      String description, String btnOk, String btnCancel, SweetAlertStyle icon_,Function callback) async {
        Alert(
      context: context,
      type: AlertType.warning,
      title: title,
      desc: description,
      buttons: [
        DialogButton(
          child: Text(
            btnOk,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => callback(true),
          color: Colors.red,
        ),
        DialogButton(
          child: Text(
           btnCancel,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context), 
          color: Colors.blue,

        )
      ],
    ).show();
    /*
     SweetAlert.show(context,
                      title: title,
                      subtitle: description,
                      style: icon_,
                      cancelButtonText:btnCancel,
                      confirmButtonText:btnOk,
                      confirmButtonColor: Colors.red,
                      cancelButtonColor: Colors.blue,
                      showCancelButton: true, onPress: (bool isConfirm)  {
          callback(isConfirm) ;
      });*/
    /*
    var result = await showDialog(
      context: context,
      builder: (BuildContext context) => CustomDialog(
        title: title,
        description: description,
        buttonText: btnOk,
        buttonTextCancel: btnCancel,
        icon_: icon_,
      ),
    );*/
    //return result!=null?result:false;
  }

  void showDialogResponse(BuildContext context_, String title,
      String description, String cancelText ,AlertType status) {
        //Alert(context: context_, title: "RFLUTTER", desc: "Flutter is awesome.").show();
Alert(
      context: context_,
      type: status,
      title: title,
      desc: description,
      buttons: [
        DialogButton(
          child: Text(
            cancelText,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context_),
          width: 120,
        )
      ],
    ).show();
      /*  return  SweetAlert.show(context_, title: title, subtitle: description,
        style: status,confirmButtonText:cancelText,confirmButtonColor: Colors.blue );*/
    /*showDialog(
      context: context_,
      builder: (BuildContext context) => SweetAlert.show(context, title: "Just show a message") /*CustomDialog(
        contexto_: context,
        title: title,
        description: description,
        buttonText: btnOk,
        icon_: icon_,
      ),*/
    );*/
  }
}

class Consts {
  Consts._();
  static const double padding = 0.0;
  static const double avatarRadius = 46.0;
}

class ColorLoader3 extends StatefulWidget {
  final double radius;
  final double dotRadius;

  ColorLoader3({this.radius = 17, this.dotRadius = 5.0});

  @override
  _ColorLoader3State createState() => _ColorLoader3State();
}

class _ColorLoader3State extends State<ColorLoader3>
    with SingleTickerProviderStateMixin {
  Animation<double> animation_rotation;
  Animation<double> animation_radius_in;
  Animation<double> animation_radius_out;
  AnimationController controller;

  double radius;
  double dotRadius;

  @override
  void initState() {
    super.initState();

    radius = widget.radius;
    dotRadius = widget.dotRadius;

    controller = AnimationController(
        lowerBound: 0.0,
        upperBound: 1.0,
        duration: const Duration(milliseconds: 3000),
        vsync: this);

    animation_rotation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 1.0, curve: Curves.linear),
      ),
    );

    animation_radius_in = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.75, 1.0, curve: Curves.elasticIn),
      ),
    );

    animation_radius_out = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 0.25, curve: Curves.elasticOut),
      ),
    );

    controller.addListener(() {
      setState(() {
        if (controller.value >= 0.75 && controller.value <= 1.0)
          radius = widget.radius * animation_radius_in.value;
        else if (controller.value >= 0.0 && controller.value <= 0.25)
          radius = widget.radius * animation_radius_out.value;
      });
    });

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {}
    });

    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 80.0,
      //color: Colors.black12,
      child: new Center(
        child: new RotationTransition(
          turns: animation_rotation,
          child: new Container(
            //color: Colors.limeAccent,
            child: new Center(
              child: Stack(
                children: <Widget>[
                  new Transform.translate(
                    offset: Offset(0.0, 0.0),
                    child: Dot(
                      radius: radius,
                      color: Colors.black12,
                    ),
                  ),
                  new Transform.translate(
                    child: Dot(
                      radius: dotRadius,
                      color: Colors.amber,
                    ),
                    offset: Offset(
                      radius * cos(0.0),
                      radius * sin(0.0),
                    ),
                  ),
                  new Transform.translate(
                    child: Dot(
                      radius: dotRadius,
                      color: Colors.deepOrangeAccent,
                    ),
                    offset: Offset(
                      radius * cos(0.0 + 1 * pi / 4),
                      radius * sin(0.0 + 1 * pi / 4),
                    ),
                  ),
                  new Transform.translate(
                    child: Dot(
                      radius: dotRadius,
                      color: Colors.pinkAccent,
                    ),
                    offset: Offset(
                      radius * cos(0.0 + 2 * pi / 4),
                      radius * sin(0.0 + 2 * pi / 4),
                    ),
                  ),
                  new Transform.translate(
                    child: Dot(
                      radius: dotRadius,
                      color: Colors.purple,
                    ),
                    offset: Offset(
                      radius * cos(0.0 + 3 * pi / 4),
                      radius * sin(0.0 + 3 * pi / 4),
                    ),
                  ),
                  new Transform.translate(
                    child: Dot(
                      radius: dotRadius,
                      color: Colors.yellow,
                    ),
                    offset: Offset(
                      radius * cos(0.0 + 4 * pi / 4),
                      radius * sin(0.0 + 4 * pi / 4),
                    ),
                  ),
                  new Transform.translate(
                    child: Dot(
                      radius: dotRadius,
                      color: Colors.lightGreen,
                    ),
                    offset: Offset(
                      radius * cos(0.0 + 5 * pi / 4),
                      radius * sin(0.0 + 5 * pi / 4),
                    ),
                  ),
                  new Transform.translate(
                    child: Dot(
                      radius: dotRadius,
                      color: Colors.orangeAccent,
                    ),
                    offset: Offset(
                      radius * cos(0.0 + 6 * pi / 4),
                      radius * sin(0.0 + 6 * pi / 4),
                    ),
                  ),
                  new Transform.translate(
                    child: Dot(
                      radius: dotRadius,
                      color: Colors.blueAccent,
                    ),
                    offset: Offset(
                      radius * cos(0.0 + 7 * pi / 4),
                      radius * sin(0.0 + 7 * pi / 4),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class Dot extends StatelessWidget {
  final double radius;
  final Color color;

  Dot({this.radius, this.color});

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: Container(
        width: radius,
        height: radius,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}

class CustomDialog extends StatelessWidget {
  final BuildContext contexto_;
  final String title, description, buttonText, buttonTextCancel;
  final IconData icon_;

  CustomDialog({
    @required this.contexto_,
    this.title,
    this.description,
    this.buttonTextCancel,
    @required this.buttonText,
    @required this.icon_
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Consts.padding),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: Consts.avatarRadius + Consts.padding,
            bottom: Consts.padding,
            left: 10,
            right: 10,
          ),
          //margin: EdgeInsets.only(top: Consts.avatarRadius),
          decoration: new BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: const Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // To make the card compact
            children: <Widget>[
             /* SizedBox(height: 16.0),
              Text(
                title,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),*/
              SizedBox(height: 16.0),
              Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 20,
                    ),
                    
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop(false); // option no; To close the dialog
                        },
                        child: Text(buttonTextCancel!=null?buttonTextCancel:""),
                      ),
                    ),
                   
                    Align(
                      alignment: Alignment.bottomRight,
                      child: FlatButton(
                        onPressed: () {

                          Navigator.of(context).pop(true); //option yes; To close the dialog
                        },
                        child: Text(buttonText),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
          left: Consts.padding,
          right: Consts.padding,
           child: Container(
              child: Icon(
                icon_,
                size: 80,
                color: Colors.red,
              ),
            ),
          /*child: CircleAvatar(
            backgroundColor: Colors.red,
            radius: Consts.avatarRadius,
            child: Container(
              child: Icon(
                icon_,
                size: 50,
                color: Colors.white,
              ),
            ),
          ),*/
        ),
        //...top circlular image part,
      ],
    );
  }
}
