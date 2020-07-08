import 'package:flutter/material.dart';

class TextFieldForm extends StatefulWidget {
  Map<String,dynamic> options;
  /*
  {'name': 'nrodocumento',
  'label': 'Núm. Documento',
  'validate': "required|digits:8",
  'messagesErrors':{'required':'El campo número de documento es requerido','digits':'El campo número de documento debe ser de 8 dígitos'},
  'icon': Icons.chrome_reader_mode
  }
   */
  TextFieldForm(Map<String,dynamic> options) {
    this.options = options;
  }

  @override
  _TextFieldStateForm createState() => _TextFieldStateForm();
}
 
class _TextFieldStateForm extends State<TextFieldForm> {
  var _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      
      child: TextFormField(
      controller: _controller,
      onChanged: (val) {
        _formKey.currentState.save();
      },
      onSaved: (String val) => setState(() => _controller.text = val),
      validator: (val) {
        var itemvalue;
        if (widget.options["validate"]==null) {
          return null;
        }
        for (var item in widget.options["validate"].split("|")) {
          itemvalue = item.split(":").length>1?item.split(":")[1]:null;
          item = item.split(":")[0];
          switch (item) {
            case 'required':
              if (val.isEmpty) {
                return widget.options["messagesErrors"][item];
              }
              break;
            case 'digits':
              int digitos = int.parse(itemvalue);
              if (val.length != digitos) {
                return widget.options["messagesErrors"][item];
              }
              break;
            default:
          }
        }
        return null;
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          prefixIcon: Icon(
            widget.options["icon"],
            size: 28.0,
          ),
          suffixIcon: IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                _controller.clear();
              }),
          hintText: widget.options["label"],
          helperText: 'texto de ayuda xd'
          ),
    ),
    );
  }
}
