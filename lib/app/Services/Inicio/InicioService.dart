import 'dart:io';

import 'package:probando_flutter/app/Config/config.dart';

//webservices
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:probando_flutter/utils/dart/sharedPreferences.dart';
 Future menuService() async {
   sharedPreferences sharedPrefs = new sharedPreferences();
   var token = json.decode( await  sharedPrefs.read("dataUsuario", ""))["api_token"];
    try {
      final response = await http.get(ROOT+'appmovil/menuCargar/',
       headers: {HttpHeaders.authorizationHeader: "$token"});
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        print("ERROR");
        print(response);
        return false;
      }
    } catch (e) {
      print("eee");
      print(e);
      return e;
    }
}