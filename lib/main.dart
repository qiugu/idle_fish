import 'package:flutter/material.dart';
import './routes/RouteConfig.dart';
import 'navigator/tab_navigator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/tabs',
      // 路由传参
      onGenerateRoute: onGenerateRoute,
      home: TabNavigator(),
    );
  }
}
