import 'package:flutter/material.dart';
import 'package:preferenciasusuario/src/shared_preferences/preferencias_usuario.dart';
import 'package:preferenciasusuario/src/widgets/menu_widget.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  
  static final String routeName = "settings";

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  
  bool _colorSecundario;
  int _genero;
  //String _nombre = "Rosa Melano";
  TextEditingController _textEditingController;

  final prefs = PreferenciasUsuario();

  @override
  void initState() {
    super.initState();
    
    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
    prefs.ultimaPagina = SettingsPage.routeName;

    _textEditingController = TextEditingController(text: prefs.nombreUsuario);
    // _cargarPrefs();
  }

  // _cargarPrefs() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   _genero = prefs.getInt("genero");
  //   setState(() {});
  // }

  _setSelectetRadio(int valorSeleccion)  {

    // prefs.setInt("genero", valorSeleccion);
    prefs.genero = valorSeleccion;
    _genero = valorSeleccion;
    setState(() {});
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ajustes"),
        backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.yellow,
      ),
      drawer: MenuWidget(),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text("Settings", style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold))
          ),
          Divider(),
          SwitchListTile(
            title: Text("Color secundario"),
            value: _colorSecundario, 
            onChanged: (value){
              _colorSecundario = value;
              prefs.colorSecundario = value;
              setState(() {});
            },
          ),
          RadioListTile(
            title: Text("Masculino"),
            value: 1, 
            groupValue: _genero, 
            onChanged: _setSelectetRadio,
          ),
          RadioListTile(
            title: Text("Femenino"),
            value: 2, 
            groupValue: _genero, 
            onChanged: _setSelectetRadio
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                labelText: "Nombre",
                helperText: "Nombre de la persona que usa el teléfono",
              ),
              onChanged: (value) {
                prefs.nombreUsuario = value;
              },
            ),
          )
        ]
      )
    );
  }
}