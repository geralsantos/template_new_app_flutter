import 'package:probando_flutter/app/Config/config.dart';

//webservices
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

 Future getDataProyectos() async {
    try {
      final response = await http
          .get(ROOT+'montaje/proyectos/ver/');
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return 'success';
      }
    } catch (e) {
      return 'error';
    }
}
 Future getDataSolids(int proyecto_id) async {
    try {
      final response = await http
          .get(ROOT+'produccion/solid/ver/'+proyecto_id.toString());
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return 'success';
      }
    } catch (e) {
      return 'error';
    }
}
Future getDataActividades() async {
    try {
      final response = await http
          .get(ROOT+'produccion/tareas/ver/');
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return 'success';
      }
    } catch (e) {
      return 'error';
    }
}
Future getDataTrabajadores() async {
    try {
      final response = await http
          .get(ROOT+'produccion/trabajadores/ver/');
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return 'success';
      }
    } catch (e) {
      return 'error';
    }
}