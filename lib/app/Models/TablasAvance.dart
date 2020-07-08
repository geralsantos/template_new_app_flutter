class Proyecto {
   final int id;
   final String nombre;
  Proyecto({this.id,this.nombre});
  factory Proyecto.fromJson(Map<String,dynamic> json){
    return Proyecto(id: json['id'] as int,nombre: json['nombre'] as String);
  }
}