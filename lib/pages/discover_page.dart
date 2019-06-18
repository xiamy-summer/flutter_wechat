import 'package:flutter/material.dart';
import 'package:wechat/widget/appbar_widget.dart';

/// @author SumMer
/// @date 2019-06-12 01210:40
/// @Description: 发现界面

class DiscoverWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _DiscoverWidgetState();
  }
}

class _DiscoverWidgetState extends State<DiscoverWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBarWidget(title: "发现"),
      body: new ListView(
        children: <Widget>[
          _findnormalcell("assets/discover/ff_IconShowAlbum.png", "朋友圈",
              "assets/2.0x/arrowOnclick_ico@2x.png"),
          _findnormalcell("assets/discover/ff_IconQRCode.png", "扫一扫",
              "assets/2.0x/arrowOnclick_ico@2x.png"),
          _findnormalcell("assets/2.0x/GameCenterH5GameMenuBtn@2x.png", "游戏",
              "assets/2.0x/arrowOnclick_ico@2x.png"),
          _findnormalcell("assets/2.0x/PaidDetail_MiniProgram@2x.png", "小程序",
              "assets/2.0x/arrowOnclick_ico@2x.png"),
        ],
      ),
    );
  }

  Card _findnormalcell(String iconName, String contentName, rightIcon) {
    return new Card(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: new FlatButton(
        onPressed: () {
          switch (contentName) {
            case "朋友圈":
              print("朋友圈");
              break;
            case "扫一扫":
              print("扫一扫");
              break;
            case "游戏":
              print("游戏");
              break;
            case "小程序":
              print("小程序");
              break;
          }
        },
        child: new Container(
          padding: EdgeInsets.fromLTRB(5, 20, 5, 20),
          child: new Row(
            children: <Widget>[
              new Container(
                child: Image.asset(
                  iconName,
                  width: 22,
                  height: 22,
                ),
              ),
              new Container(
                margin: EdgeInsets.only(left: 25),
                child: new Text(contentName),
              ),
              new Expanded(
                child: new Container(
                  //对齐方式
                  alignment: Alignment.centerRight,
                  //间距
                  margin: EdgeInsets.only(right: 10),
                  child: Image.asset(rightIcon),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
