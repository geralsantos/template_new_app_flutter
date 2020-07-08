import 'package:flutter/material.dart';
import 'package:probando_flutter/vistas/components/textField.dart';
import 'package:probando_flutter/vistas/components/dropDownFormField.dart';
import 'package:probando_flutter/app/Services/Avance.dart';
import 'dart:convert';
import 'package:probando_flutter/utils/flutter/HexColor.dart';
import 'package:auto_size_text/auto_size_text.dart';

class AccountForm extends StatefulWidget {
  @override
  _AccountFormState createState() => _AccountFormState();
}

class _AccountFormState extends State<AccountForm> {
  final _formKey = GlobalKey<FormState>();
  var _controller = TextEditingController();
  //var items;
  List items_ = List();
  List items_solids = List();
  List items_actividades = List();
  List items_trabajadores = List();  
  String texto_trabajadores_seleccionados = "SELECCIONAR TRABAJADOR";
  List trabajador_checked = List();  

  void _getDataProyectos() {
    getDataProyectos().then((onValue) {
      setState(() {
        items_ = onValue;
      });
    });
  }

  void _getDataActividades() {
    getDataActividades().then((onValue) {
      setState(() {
        items_actividades = onValue;
      });
    });
  }

  void _getDataTrabajadores() {
    getDataTrabajadores().then((onValue) {
      setState(() {
        items_trabajadores = onValue;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    this._getDataProyectos();
    this._getDataActividades();
    this._getDataTrabajadores();
  }

  void Function(dynamic) _getDataSolids(dynamic param) {
    if (param == -1) {
      setState(() {
        items_solids = [];
      });
    } else {
      dynamic obj = json.decode(json.encode(items_.asMap()[param]));
      int proyecto_id = obj["id"];
      setState(() {
        getDataSolids(proyecto_id).then((onValue) {
          setState(() {
            items_solids = onValue;
          });
        });
      });
    }
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Seleccione a los trabajadores"),
          content: new Container(
            height: MediaQuery.of(context)
                .size
                .height, // Change as per your requirement
            width: MediaQuery.of(context).size.width,
            child: ListView.separated(
              itemCount: items_trabajadores.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: new InkWell(
                      onTap: () {
                        setState(() {
                          items_trabajadores[index]["checked"] =
                              items_trabajadores[index]["checked"] != null
                                  ? !items_trabajadores[index]["checked"]
                                  : true;
                          int tb_seleccionados = 0;
                          for (var item in items_trabajadores) {
                            if (item["checked"] != null && item["checked"]) {
                              tb_seleccionados++;
                            }
                          }
                          texto_trabajadores_seleccionados =
                              tb_seleccionados > 0
                                  ? (tb_seleccionados == 1
                                      ? tb_seleccionados.toString() +
                                          ' TRABAJADOR SELECCIONADO'
                                      : tb_seleccionados.toString() +
                                          ' TRABAJADORES SELECCIONADOS')
                                  : 'SELECCIONAR TRABAJADOR';
                        });
                      },
                      child: Container( 
                        child: new Row(
                          children: <Widget>[
                            new Checkbox(
                                value: items_trabajadores[index]["checked"]!=null?items_trabajadores[index]["checked"]:false,
                                onChanged: (bool value) {
                                  setState(() {

                                  });
                                }) ,
                             new Expanded(child: new Text(items_trabajadores[index]["nombres"]+" "+items_trabajadores[index]["apellidos"]))
                             
                           
                          ],
                        ),
                      )),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            ),
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Aceptar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return Form(
      key: _formKey,
      autovalidate: true,
      child: Column(
        children: <Widget>[
          new Container(
            child: DropDownFormField({
              'items_': items_,
              'label': 'SELECCIONE UN PROYECTO',
              'icon': Icons.collections_bookmark,
              'messagesErrors': {'required': 'Debe seleccionar un proyecto'},
              'validate': "required"
            }, _getDataSolids),
          ),
          new Container(
            child: DropDownFormField({
              'items_': items_solids,
              'label': items_solids.length > 0
                  ? 'SELECCIONE UN SOLID'
                  : 'SELECCIONE UN PROYECTO',
              'icon': Icons.collections_bookmark,
              'messagesErrors': {'required': 'Debe seleccionar un solid'},
              'validate': "required"
            }),
          ),
          new Container(
            child: DropDownFormField({
              'items_': items_actividades,
              'label': 'SELECCIONE ACTIVIDAD',
              'icon': Icons.assignment_turned_in,
              'messagesErrors': {'required': 'Debe seleccionar una actividad'},
              'validate': "required"
            }),
          ),
          new Container(
              height: 47, // Change as per your requirement
              width: data.size.width,
              child: new InkWell(
                onTap: () {
                  _showDialog();
                },
                child: ListView(
                  children: <Widget>[
                    Container(
                      height: 45,
                      color: HexColor('#d6d6d6'),
                      child:
                          Center(child: Text(texto_trabajadores_seleccionados)),
                    )
                  ],
                ),
              )),
          RaisedButton(
            onPressed: () {},
            child: Text('Submit'),
          )
        ],
      ),
    );
  }
}
