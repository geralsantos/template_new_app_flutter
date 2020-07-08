import 'package:flutter/material.dart';
import 'package:probando_flutter/vistas/avance_form.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(1.0),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              AccountForm()
            ],
          ),
        ),
      ),
    );
  }
}
