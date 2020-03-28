import 'package:flutter/material.dart';
import '../pages/home/Home.dart';
import '../pages/Finance.dart';
import '../pages/Task.dart';
import '../pages/Center.dart';

class TabNavigator extends StatefulWidget {
  TabNavigator({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<TabNavigator> {
  int _current = 0;

  List _tab = [
    HomePage(),
    FinancePage(),
    TaskPage(),
    CenterPage()
  ];

  void _changeNavbar(int index) {
    // print(index);
    setState(() {
      this._current = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: this._tab[this._current],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this._current,
        onTap: this._changeNavbar,
        type: BottomNavigationBarType.fixed, // 多余三个时必须配置
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('闲鱼'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance),
            title: Text('鱼塘')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add),
              title: Text('卖闲置')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.adb),
            title: Text('消息')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            title: Text('我的')
          ),
        ]
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, size: 40),
        backgroundColor: Colors.amberAccent,
        elevation: 0,
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
