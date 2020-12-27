import 'package:flutter/material.dart';
import 'package:preferenciasusuario/src/pages/home_page.dart';
import 'package:preferenciasusuario/src/pages/settings_page.dart';
class MenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Container(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/img/menu-img.jpg"),
                // image: NetworkImage("https://www.w3schools.com/w3css/img_lights.jpg"),
                fit: BoxFit.cover
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.pages, color: Colors.red),
            title: Text("Volver a home"),
            onTap: () => Navigator.pushReplacementNamed(context, HomePage.routeName),
          ),
          ListTile(
            leading: Icon(Icons.party_mode, color: Colors.red),
            title: Text("Party mode"),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.people, color: Colors.red),
            title: Text("People"),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.red),
            title: Text("Ajustes"),
            // onTap: () => Navigator.pushNamed(context, SettingsPage.routeName),
            //Esto hace cambiar la raíz de las pantallas (la pantalla settings no tendrá flecha
            // para ir hacia atrás
           onTap: () => Navigator.pushReplacementNamed(context, SettingsPage.routeName),
           )
        ],
      ),
    );
  }
}