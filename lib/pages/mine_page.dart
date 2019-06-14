import 'package:flutter/material.dart';
import 'package:wechat/widget/appbar_widget.dart';

import 'personal_information.dart';

/// @author SumMer
/// @date 2019-06-12 01214:47
/// @Description: 我的页面

class MinePageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MinePageWidgetState();
  }
}

class _MinePageWidgetState extends State<MinePageWidget> {
  String headPortrait = "assets/baby.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBarWidget(
        shadow: 0,
        iconButton: Icon(Icons.camera_alt),
        bgcolor: Colors.white,
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            color: Colors.white,
            child: Container(
              margin: EdgeInsets.only(left: 20.0, bottom: 30.0, top: 15.0),
              child: new Row(
                children: <Widget>[
                  new ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: new Image.asset(
                      headPortrait,
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                  new Expanded(
                    child: new ListTile(
                      title: new Text(
                        "SumMer",
                        style: TextStyle(fontSize: 25.0),
                      ),
                      subtitle: new GestureDetector(
                        onTap: () async {
                          //路由跳转
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) =>
                                  new PersionalInfoWidget(headPortrait)));
                        },
                        child: new Row(
                          //位置，把2边空白处填满，并平分
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Text("微信号：12345678"),
                            new Image.asset(
                              "assets/qrcode.png",
                              width: 20,
                              height: 20,
                            ),
                            new Icon(
                              Icons.arrow_forward_ios,
                              size: 20.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          _card("支付", Icons.call_to_action),
          new Card(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: new Column(
              children: <Widget>[
                new ListTile(
                  leading: new Icon(Icons.dashboard),
                  title: new Text("收藏"),
                  trailing: new Icon(Icons.arrow_forward_ios),
                  onTap: () async {
                    print("收藏");
                  },
                ),
                //分割线
                new Divider(height: 0.0),
                new ListTile(
                  leading: new Icon(Icons.photo),
                  title: new Text("相册"),
                  trailing: new Icon(Icons.arrow_forward_ios),
                  onTap: () async {
                    print("相册");
                  },
                ),
                new Divider(height: 0.0),
                new ListTile(
                  leading: new Icon(Icons.credit_card),
                  title: new Text("钱包"),
                  trailing: new Icon(Icons.arrow_forward_ios),
                  onTap: () async {
                    print("钱包");
                  },
                ),
                new Divider(height: 0.0),
                new ListTile(
                  leading: new Icon(Icons.tag_faces),
                  title: new Text("表情"),
                  trailing: new Icon(Icons.arrow_forward_ios),
                  onTap: () async {
                    print("表情");
                  },
                ),
              ],
            ),
          ),
          _card("设置", Icons.settings),
        ],
      ),
    );
  }

  Card _card(String title, IconData leadingIcon,
      {IconData trailingIcon = Icons.arrow_forward_ios}) {
    return new Card(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: new Column(
        children: <Widget>[
          new ListTile(
            leading: new Icon(leadingIcon),
            title: new Text(title),
            trailing: new Icon(trailingIcon),
            onTap: () async {
              switch (title) {
                case "支付":
                  print("支付");
                  break;
                case "设置":
                  print("设置");
                  break;
              }
            },
          ),
        ],
      ),
    );
  }
}
