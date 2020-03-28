import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../components/CustomBtn.dart';
import '../models/LoginForm.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginPage();
  }
}

class LoginPage extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _form = LoginForm();
  final _usernameFocus = FocusNode();
  final _passwordFocus = FocusNode();

  bool _isLoading = false;

  String _validateUser(value) {
    // showDialog(
    //     context: context,
    //     builder: (context) {
    //       return AlertDialog(
    //         title: Text('提示'),
    //         content: Text('请输入账号或密码！'),
    //         actions: <Widget>[
    //           FlatButton(
    //               onPressed: () {
    //                 print('关闭提示');
    //                 Navigator.pop(context);
    //               },
    //               child: Text('知道了'))
    //         ],
    //       );
    //     });
    if (value.isEmpty) {
      return '请输入账号或密码！';
    }
  }

  void _login() async {
    if (this._formKey.currentState.validate()) {
      this._formKey.currentState.save();

      setState(() {
        this._isLoading = true;
      });
      
      var res = await http.post('http://localhost:3000/users/login', body: {
        'username': this._form.username,
        'password': this._form.password
      });
      if (res.statusCode == 200) {
        print(json.decode(res.body));
        Navigator.of(context).pop();
      } else {
        print(json.decode(res.body));
      }
      setState(() {
        this._isLoading = false;
      });
      print('用户名：${this._form.username}----密码：${this._form.password}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录'),
      ),
      body: Stack(
        children: <Widget>[
          ListView(
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
                  child: Form(
                    key: this._formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: '账号',
                            labelText: '账号',
                            icon: Icon(Icons.people)
                          ),
                          onSaved: (value) => this._form.username = value,
                          focusNode: this._usernameFocus,
                          textInputAction: TextInputAction.next,
                          validator: this._validateUser,
                          onEditingComplete: () {
                            // 输入账号后点击软键盘上的done取消账号输入框的焦点
                            this._usernameFocus.unfocus();
                            // 将焦点转移到密码框上
                            FocusScope.of(context)
                                .requestFocus(this._passwordFocus);
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: ('密码'),
                            labelText: '密码',
                            icon: Icon(Icons.lock)
                          ),
                          onSaved: (value) => this._form.password = value,
                          validator: this._validateUser,
                          focusNode: this._passwordFocus,
                          onEditingComplete: this._login,
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            InkWell(
                              child: Text('忘记密码'),
                              onTap: () {
                                Navigator.pushNamed(context, '/forget');
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        CustomBtn(
                          width: double.infinity,
                          text: '登录',
                          onPressed: this._login,
                        )
                      ],
                    ),
                  ))
            ],
          ),
          Visibility(
            visible: _isLoading,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        ],
      ),
    );
  }
}
