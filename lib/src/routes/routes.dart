import 'package:flutter/material.dart';

import 'package:hinutri/src/pages/editProfile_page.dart';
import 'package:hinutri/src/pages/home_page.dart';
import 'package:hinutri/src/pages/login_page.dart';
import 'package:hinutri/src/pages/tabs_page.dart';
import 'package:hinutri/src/pages/profile_page.dart';

Map<String, WidgetBuilder> getApplicationRoute() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => LoginPage(),
    'tabs': (BuildContext context) => TabsPage(),
    'home': (BuildContext context) => HomePage(),
    'profile': (BuildContext context) => ProfilePage(),
    'edit_profile': (BuildContext context) => EditProfile()
  };
}
