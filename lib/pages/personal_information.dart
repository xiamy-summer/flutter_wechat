import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wechat/widget/appbar_widget.dart';

import 'qrcode.dart';


/// @author SumMer
/// @date 2019-06-14 0149:26
/// @Description: 个人信息页面

class PersionalInfoWidget extends StatefulWidget {
  //头像
  String headPortrait;

  PersionalInfoWidget(this.headPortrait);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _PersionalInfoWidgetState();
  }
}

class _PersionalInfoWidgetState extends State<PersionalInfoWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBarWidget(
        title: "个人信息",
      ),
      body: new ListView(
        children: <Widget>[
          _cardbeltwidget(
            "头像",
            new ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: new Image.asset(
                widget.headPortrait,
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
          ),
          _cardbeltwidget(
            "姓名",
            new Text("SumMer"),
          ),
          _cardbeltwidget(
            "微信号",
            new Text("123456"),
          ),
          _cardbeltwidget(
            "我的二维码",
            new Image.asset(
              "assets/mine/qrcode.png",
              width: 25,
              height: 25,
            ),
          ),
          _card("更多"),
          new Padding(padding: EdgeInsets.only(top: 10.0)),
          _card("收货地址"),
          _card("我的发票抬头"),
        ],
      ),
    );
  }

  Card _card(String context) {
    return new Card(
      margin: EdgeInsets.all(0.0),
      child: new FlatButton(
        onPressed: () {
          print("点击");
        },
        child: new Container(
          margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: new Row(
            children: <Widget>[
              new Text(context),
              new Expanded(
                child: new Row(
                  //位置，显示在最右侧
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    new Icon(Icons.arrow_forward_ios),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Card _cardbeltwidget(String text, Widget widget) {
    return new Card(
      margin: EdgeInsets.all(0.0),
      child: new FlatButton(
        onPressed: () {
          ScreenUtil.instance = ScreenUtil(width: window.physicalSize.width,
              height: window.physicalSize.height)
            ..init(context);
          print("${window.physicalSize.height / 4 + 50}");
          print("${window.physicalSize.width / 3 + 80}");
          print("${ScreenUtil.getInstance().setWidth(300)}");
          print("${ScreenUtil.getInstance().setHeight(300)}");


          switch (text) {
            case "我的二维码":
            //路由跳转
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) =>
                      new QrCode(
                        "summer-123456",
                        size: 250.0,
                      )));
              break;
          }
        },
        child: new Container(
          margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: new Row(
            children: <Widget>[
              new Text(text),
              new Expanded(
                child: new Row(
                  //位置，显示在最右侧
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    widget,
                    new Padding(padding: EdgeInsets.only(left: 5.0)),
                    new Icon(Icons.arrow_forward_ios),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
