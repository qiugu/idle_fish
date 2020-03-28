import 'package:flutter/material.dart';

class CenterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: Text('登录'),
        onPressed: () {
          Navigator.pushNamed(context, '/login');
        },
      ),
    );
  }
}