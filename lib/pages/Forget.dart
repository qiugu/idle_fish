import 'package:flutter/material.dart';
import '../components/ForgetStep.dart';

class ForgetPage extends StatelessWidget {
  const ForgetPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('忘记密码'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            // child: Image.network(
            //   'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2740262966,2133567591&fm=26&gp=0.jpg',
            //   fit: BoxFit.cover,
            // ),
            decoration: BoxDecoration(color: Colors.red),
            height: 200,
          ),
          Container(
              padding: EdgeInsets.all(30),
              child: ForgetStep()
          )
        ],
      ),
    );
  }
}
