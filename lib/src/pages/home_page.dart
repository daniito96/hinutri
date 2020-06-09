import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:hinutri/src/utils/ListaUsuarios.dart';

import 'package:hinutri/src/services/UserService.dart';
import 'package:hinutri/src/providers/UserProvider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //     statusBarColor: Colors.transparent,
    //     statusBarIconBrightness: Brightness.dark));
    var userServices = Provider.of<UserService>(context);

    print(userServices.usuarios.length);

    return Scaffold(
      body: /* ListaUsuarios(usuarios: userService.usuarios) */
          SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 30.0, right: 120.0),
              child: Text(
                'Bienvenido Daniel !!',
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListaUsuarios(),
          ],
        ),
      ),
    );
  }
}

class FloatingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final status = Provider.of<UserProvider>(context);

    return FloatingActionButton(
        child: Icon(Icons.exit_to_app),
        backgroundColor: Colors.deepPurple,
        onPressed: () => status.logout());
  }
}
