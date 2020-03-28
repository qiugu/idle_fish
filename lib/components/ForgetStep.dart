import 'dart:async';

import 'package:flutter/material.dart';
import './CustomBtn.dart';

class ForgetStep extends StatefulWidget {
  ForgetStep({Key key}) : super(key: key);

  @override
  _ForgetStepState createState() => _ForgetStepState();
}

class _ForgetStepState extends State<ForgetStep> {
  int _step;
  int _timeout;
  bool _disabled;

  @override
  void initState() {
    super.initState();
    setState(() {
      this._step = 0;
      this._timeout = 60;
      this._disabled = false;
    });
  }

  void _next() {
    setState(() {
      this._step++;
    });
  }

  void _prev() {
    setState(() {
      this._step--;
    });
  }

  void _complete() {
    Navigator.pushReplacementNamed(context, '/login');
  }

  void _getCapcha() {
    const timeout = const Duration(seconds: 1);
    Timer.periodic(timeout, (time){
      setState(() {
        this._timeout--;
      });
      if (this._timeout < 0) {
        time.cancel();
        setState(() {
          this._timeout = 60;
          this._disabled = false;
        });
      }
    });
    setState(() {
      this._disabled = true;
      this._timeout = 59;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Visibility(
          visible: this._step == 0,
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: '账号'),
              ),
              SizedBox(height: 20),
              CustomBtn(
                width: double.infinity,
                text: '下一步',
                onPressed: this._next,
              )
            ],
          ),
        ),
        Visibility(
          visible: this._step == 1,
          child: Column(
            children: <Widget>[
              Form(
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                          hintText: '请输入注册预留号码', border: OutlineInputBorder()),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: '验证码', border: OutlineInputBorder()),
                          ),
                        ),
                        SizedBox(width: 20),
                        CustomBtn(
                          text: this._timeout < 60 ? '${this._timeout}秒后重新获取' :'获取验证码',
                          onPressed: this._disabled ? null : this._getCapcha,
                        )
                        // Text('data')
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CustomBtn(
                    text: '上一步',
                    onPressed: this._prev,
                  ),
                  CustomBtn(
                    text: '下一步',
                    onPressed: this._next,
                  ),
                ],
              )
            ],
          ),
        ),
        Visibility(
          visible: this._step == 2,
          child: Column(children: <Widget>[
            Form(
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                        hintText: '新密码', border: OutlineInputBorder()),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                        hintText: '确认密码', border: OutlineInputBorder()),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CustomBtn(
                  text: '上一步',
                  onPressed: this._prev,
                ),
                CustomBtn(
                  text: '完成',
                  onPressed: this._complete,
                ),
              ],
            )
          ]),
        )
      ],
    );
  }
}
