import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hinutri/src/providers/UserProvider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Stack(
          children: <Widget>[_crearFondo(context), _loginForm(context)],
        ),
      ),
    );
  }

  Widget _crearFondo(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final fondoMorado = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: <Color>[
        Color.fromRGBO(63, 63, 156, 1.0),
        Color.fromRGBO(90, 70, 178, 1.0)
      ])),
    );

    final circulo = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Color.fromRGBO(255, 255, 255, 0.05)),
    );

    return Stack(
      children: <Widget>[
        fondoMorado,
        Positioned(
          child: circulo,
          top: 80.0,
          left: 20.0,
        ),
        Positioned(
          child: circulo,
          top: -40.0,
          right: -30.0,
        ),
        Positioned(
          child: circulo,
          bottom: -50.0,
          right: -10.0,
        ),
        Positioned(
          child: circulo,
          bottom: 120.0,
          right: 20.0,
        ),
        Positioned(
          child: circulo,
          bottom: -50.0,
          left: -20.0,
        ),
        Container(
          padding: EdgeInsets.only(top: 80.0),
          child: Column(
            children: <Widget>[
              Icon(
                Icons.account_circle,
                color: Colors.white,
                size: 100.0,
              ),
              SizedBox(
                height: 10.0,
                width: double.infinity,
              ),
              Text(
                'Bienvenido a ',
                style: TextStyle(color: Colors.white, fontSize: 25.0),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _loginForm(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: 210.0,
            ),
          ),
          Container(
            width: size.width * 0.85,
            margin: EdgeInsets.symmetric(vertical: 15.0),
            padding: EdgeInsets.symmetric(vertical: 50.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 4.0,
                  offset: Offset(0.0, 5.0),
                  spreadRadius: 3.0,
                )
              ],
            ),
            child: Column(
              children: <Widget>[
                Text('Hi Nutri !', style: TextStyle(fontSize: 20.0)),
                SizedBox(
                  height: 60.0,
                ),
                _crearEmail(),
                SizedBox(
                  height: 20.0,
                ),
                _crearPassword(),
                SizedBox(
                  height: 20.0,
                ),
                _crearBoton(context),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text('¿ Olvidaste la contraseña ?'),
          SizedBox(
            height: 90.0,
          )
        ],
      ),
    );
  }

  Widget _crearEmail() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon(
              Icons.alternate_email,
              color: Colors.deepPurple,
            ),
            hintText: 'ejemplo@corre.com',
            labelText: 'Correo Electrónico',
            // counterText: snapshot.data,
            // errorText: snapshot.error),
          ),
        ));
  }

  Widget _crearPassword() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        obscureText: true,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(
            Icons.lock_open,
            color: Colors.deepPurple,
          ),
          labelText: 'Contraseña',
          // counterText: snapshot.data,
          // errorText: snapshot.error,
        ),
      ),
    );
  }

  Widget _crearBoton(BuildContext context) {
    final status = Provider.of<UserProvider>(context);

    return RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        color: Colors.deepPurple,
        textColor: Colors.white,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
          child: Text('Ingresar'),
        ),
        onPressed: () => status.login());
  }
}
