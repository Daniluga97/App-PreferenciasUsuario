import 'package:flutter/material.dart';
import 'package:preferenciasusuario/src/shared_preferences/preferencias_usuario.dart';
import 'package:preferenciasusuario/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  
  static final String routeName = "home";
  final prefs = PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    
    prefs.ultimaPagina = HomePage.routeName;

    return Scaffold(
      appBar: AppBar(
        title: Text("Preferencias de Usuario"),
        backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.yellow,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Divider(),
          Text("Color secundario: ${prefs.colorSecundario}"),
          Divider(),
          Text("Género: ${prefs.genero}"),
          Divider(),
          Text("Nombre de usuario: ${prefs.nombreUsuario}"),
          Divider(),
        ],
      ),
    );
  }
}