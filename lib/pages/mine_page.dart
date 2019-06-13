import 'package:flutter/material.dart';
import 'package:wechat/widget/appbar_widget.dart';

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
                      "assets/baby.jpg",
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                  new Expanded(
                    child: new ListTile(

                      title: new Text("SumMer",style: TextStyle(fontSize: 25.0),),
                      subtitle: new Row(
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
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
