import 'package:flutter/material.dart';
import 'BaseData.dart';
import '../../components/CustomBtn.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  List<Widget> _getOverview() {
    List list = new List<Widget>();
    List<BaseData> data = new List<BaseData>();
    data.addAll([
      BaseData('需求总数', 1234, '项'),
      BaseData('需求处理数', 1234, '项'),
      BaseData('授信数', 1234, '次'),
      BaseData('授信金额', 1234, '万'),
      BaseData('放款数', 1234, '次'),
      BaseData('放款金额', 1234, '万'),
      BaseData('业务完结数', 1234, '万', items: 123),
      BaseData('业务完结比例', 1234, '%')
    ]);
    for (int i = 0; i < 8; i++) {
      list.add(Container(
        decoration: BoxDecoration(border: Border.all()),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('${data[i].itemName}'),
            data[i].items != null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text('${data[i].amount}${data[i].unit}'),
                      Text('${data[i].items}家')
                    ],
                  )
                : Text('${data[i].amount}${data[i].unit}'),
          ],
        ),
      ));
    }
    return list;
  }

  List<Widget> _getDemand() {
    List list = new List<Widget>();
    list.addAll([
      ListTile(
                  leading: Container(
                    child: Text('产品申请'),
                    padding: EdgeInsets.fromLTRB(12, 6, 12, 6),
                    decoration: BoxDecoration(
                      color: Colors.grey
                    ),
                  ),
                  title: Text(
                    '中国人民银行中国人民银行中国人民银行',
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: CustomBtn(
                    width: 100,
                    height: 30,
                    text: '处理',
                    onPressed: () {},
                  ),
                ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      Container(
        // child: Image.network(
        //   'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2740262966,2133567591&fm=26&gp=0.jpg',
        //   fit: BoxFit.cover,
        // ),
        decoration: BoxDecoration(color: Colors.red),
        height: 200,
      ),
      GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1.4,
        shrinkWrap: true,
        padding: EdgeInsets.all(20),
        physics: NeverScrollableScrollPhysics(),
        children: _getOverview(),
      ),
      Column(
        children: <Widget>[
          Text(
            '最新需求',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700
            ),
          ),
          Container(
            height: 200,
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all()
            ),
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: Container(
                    child: Text('产品申请'),
                    padding: EdgeInsets.fromLTRB(12, 6, 12, 6),
                    decoration: BoxDecoration(
                      color: Colors.grey
                    ),
                  ),
                  title: Text(
                    '中国人民银行中国人民银行中国人民银行',
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: CustomBtn(
                    width: 100,
                    height: 30,
                    text: '处理',
                    onPressed: () {},
                  ),
                ),
                ListTile(
                  leading: Text('产品申请'),
                  title: Text('中国人民银行')
                ),
                ListTile(
                  leading: Text('产品申请'),
                  title: Text('中国人民银行')
                ),
                ListTile(
                  leading: Text('产品申请'),
                  title: Text('中国人民银行')
                ),
                ListTile(
                  leading: Text('产品申请'),
                  title: Text('中国人民银行')
                )
              ],
            ),
          )
        ],
      )
    ]);
  }
}
