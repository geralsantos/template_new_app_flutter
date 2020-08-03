import 'dart:io';

import 'package:intl/intl.dart';
import 'package:probando_flutter/app/Config/config.dart';

//webservices
import 'package:http/http.dart' as http;
import 'package:probando_flutter/app/Models/Clases.dart';
import 'dart:async';
import 'dart:convert';

import 'package:probando_flutter/utils/dart/sharedPreferences.dart';
 Future calendarioService(DateTime dateDesdeFecha,DateTime dateHastaFecha) async {
    try {
      sharedPreferences sharedPrefs = new sharedPreferences();
      var token = json.decode( await  sharedPrefs.read("dataUsuario", ""))["api_token"];
      final formatoFecha = new DateFormat('yyyy-MM-dd');
      String fdateDesdeFecha = formatoFecha.format(dateDesdeFecha).toString();
      String fdateHastaFecha = formatoFecha.format(dateHastaFecha).toString();
      final response = await http.post(ROOT+'appmovil/calendarioCargar/',
      headers: {HttpHeaders.authorizationHeader: "$token"},
      body: {
        "dateDesdeFecha": fdateDesdeFecha,
        "dateHastaFecha": fdateHastaFecha,
      }
      );
    
      if (response.statusCode == 200) {
        // Si el servidor devuelve una repuesta OK, parseamos el JSON
        return Clases.parseData(json.encode(json.decode(response.body)["data"]));
      } else {
        print("ERROR");
        // Si esta respuesta no fue OK, lanza un error.
        throw Exception('Falló en cargar las clases desde el servidor');
      }
     
    } catch (e) {
      print(e);
      return e;
    }
}