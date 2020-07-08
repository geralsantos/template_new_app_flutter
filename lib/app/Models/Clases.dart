class Clases {
  Clases({
    this.id = 0,
    this.nombre = "",
    this.hora_inicio = "",
    this.hora_fin = "",
    this.fecha = "",
  });

  int id;
  String nombre;
  String hora_inicio;
  String hora_fin;
  String fecha;

  static List<Clases> clasesList = <Clases>[
    Clases(
      id: 1,
      nombre: 'Clase de matemáticas',
      hora_inicio: '10:00',
      hora_fin: '11:30',
      fecha: '6 de Julio del 2020',

    ), 
    Clases(
      id: 2,
      nombre: 'Clase de Tecnología y Comunicación',
      hora_inicio: '10:00',
      hora_fin: '11:30',
      fecha: '7 de Julio del 2020',
    ), 
    Clases(
      id: 3,
      nombre: 'Clase de Inglés 2',
      hora_inicio: '10:00',
      hora_fin: '11:30',
      fecha: '8 de Julio del 2020',

    ),
    Clases(
      id: 4,
      nombre: 'Clase de Computación 2',
      hora_inicio: '10:00',
      hora_fin: '11:30',
      fecha: '9 de Julio del 2020',

    ),
  ];
 
}
