import 'package:flutter/material.dart';
import '../pages/home/Home.dart';
import '../pages/Finance.dart';
import '../pages/Task.dart';
import '../pages/Center.dart';
import '../pages/Login.dart';
import '../navigator/tab_navigator.dart';
import '../pages/Forget.dart';

final Map routes = {
  '/login': (context) => Login(),
  '/home': (context) => HomePage(),
  '/finance': (context) => FinancePage(),
  '/task': (context) => TaskPage(),
  '/center': (context) => CenterPage(),
  '/forget': (context) => ForgetPage(),
  '/tabs': (context) => TabNavigator()
};

final Function onGenerateRoute = (RouteSettings settings) {
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  Route route;
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
    } else {
      route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
    }
  }
  return route;
};
