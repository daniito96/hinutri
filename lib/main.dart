import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hinutri/src/pages/home_page.dart';

import 'package:hinutri/src/pages/login_page.dart';

import 'package:hinutri/src/providers/UserProvider.dart';
import 'package:hinutri/src/services/UserService.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => UserService())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hi Nutri',
        // initialRoute: UserProvider().isLoggedIn() ? 'home' : '/',
        // routes: getApplicationRoute(),
        routes: {
          '/': (BuildContext context) {
            var state = Provider.of<UserProvider>(context);
            var data = Provider.of<UserService>(context);    /* <--- al ponerle "var" en 
                                                    vez de "final" me muestra data en home_page.dart  */

            if (state.isLoggedIn()) {
              return HomePage();
            } else {
              return LoginPage();
            }
          }
        },
        theme: ThemeData(primaryColor: Colors.green),
      ),
    );
  }
}
