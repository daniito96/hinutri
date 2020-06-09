import 'package:flutter/material.dart';
import 'package:hinutri/src/models/User.dart';


class ListaUsuarios extends StatelessWidget {


  final List<Persona> usuarios;

  const ListaUsuarios({this.usuarios});

  @override
  Widget build(BuildContext context) {
    return 
    ListView.builder(
        itemCount: this.usuarios.length,
        itemBuilder: (BuildContext context, int index) {
          return _Usuario(usuarios: this.usuarios[index], index: index);
        },

    );
  }
}

class _Usuario extends StatelessWidget {
  final Persona usuarios;
  final int index;

  const _Usuario({@required this.usuarios, @required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _TarjetaInfo(
          usuarios: usuarios,
          index: index,
        ),
      ],
    );
  }
}

class _TarjetaInfo extends StatelessWidget {
  final Persona usuarios;
  final int index;
  const _TarjetaInfo({this.usuarios, this.index});

  @override
  Widget build(BuildContext context) {
    return 
    
     Card(
      elevation: 4.0,
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.folder_open, color: Colors.blue),
            title: Text('${usuarios.firstName} ${usuarios.lastName}'),
            subtitle: Text(usuarios.email),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              RaisedButton(
                child: Text('Ver Info'),
                color: Colors.deepPurple,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
    
  }
}
