// import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {

  // Se viene SINGLETON
  static final PreferenciasUsuario _instancia = PreferenciasUsuario._();
  
  PreferenciasUsuario._();
  
  SharedPreferences _prefs;

  factory PreferenciasUsuario(){
    return _instancia;
  }

  initPrefs() async{
    _prefs = await SharedPreferences.getInstance();
  }

  //GET y SET del genero
  get genero {
    return _prefs.getInt("genero") ?? 1;
  }

  set genero(int valorGenero) {
     _prefs.setInt("genero", valorGenero);
  }

  get colorSecundario {
    // ?? 1 -> aka si no existe pon un true
    return _prefs.getBool("colorSecundario") ?? true;
  }

  set colorSecundario(bool colorSecundario) {
     _prefs.setBool("colorSecundario", colorSecundario);
  }

  get nombreUsuario {
    return _prefs.getString("nombreUsuario") ?? "";
  }

  set nombreUsuario(String valorNombre) {
     _prefs.setString("nombreUsuario", valorNombre);
  }

  get ultimaPagina {
    return _prefs.getString("ultimaPagina") ?? "home";
  }

  set ultimaPagina(String valorUltimaPagina) {
     _prefs.setString("ultimaPagina", valorUltimaPagina);
  }


  //Ninguna de estas propiedades se usa
  // bool _colorSecundario;
  // int _genero;
  // String _nombre;





}