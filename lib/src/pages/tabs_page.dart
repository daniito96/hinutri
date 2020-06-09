import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:hinutri/src/providers/NavigateProvider.dart';


class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NavigateProvider(),
          child: Scaffold(
        body: _Pages(),
        bottomNavigationBar: _Navigate(),
      ),
    );
  }
}

class _Navigate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    final navigateModel = Provider.of<NavigateProvider>(context);


    return BottomNavigationBar(
      currentIndex: navigateModel.paginaActual,
      onTap: (i) => navigateModel.paginaActual = i ,
      items: [
      BottomNavigationBarItem(
        icon: Icon(Icons.event_note),
        title: Text('Noticias'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.people_outline),
        title: Text('Home'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person_pin_circle),
        title: Text('Perfil'),
      ),
    ]);
  }
}

class _Pages extends StatelessWidget { 
  
  @override
  Widget build(BuildContext context) {

  final navigateModel = Provider.of<NavigateProvider>(context);


    return PageView(
      controller: navigateModel.pageController,
      physics: BouncingScrollPhysics(),
      children: <Widget>[
        Container(
          color: Colors.red,
        ),
        Container(
          color: Colors.blue,
        ),
        Container(
          color: Colors.green,
        ),
      ],
    );
  }
}





