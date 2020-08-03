import 'dart:convert';

class Clases {
  Clases(
    this.id,
    this.nombre,
    this.hora_inicio,
    this.hora_fin,
    this.fecha,
  );

  int id;
  String nombre;
  String hora_inicio;
  String hora_fin;
  String fecha;

  static List<Clases> parseData(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Clases>((json) => Clases.fromMap(json)).toList();
  }

  factory Clases.fromMap(Map<String, dynamic> json) {
    return Clases(
      json["id"],
      json["nombre"],
      json["hora_inicio"],
      json["hora_fin"],
      json["fecha"],
    );
  }
}
