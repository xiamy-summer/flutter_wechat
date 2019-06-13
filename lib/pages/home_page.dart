import 'package:flutter/material.dart';
import 'package:wechat/widget/appbar_widget.dart';
import 'package:wechat/widget/search_widget.dart';

/// @author SumMer
/// @date 2019-06-10 01017:13
/// @Description:

class HomePageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _HomePageWidgetState();
  }
}

class _HomePageWidgetState extends State<HomePageWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBarWidget(
        title: "微信",
        iconButton: AppBarMenuWidget(),
        height: 100.0,
        search: new SearchWidget(),
      ),
    );
  }
}

//首页appbar上的按钮
class AppBarMenuWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _AppBarMenuWidgetState();
  }
}

class _AppBarMenuWidgetState extends State<AppBarMenuWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      onTap: () async {
        final result = await showMenu(
            context: context,
            position: RelativeRect.fromLTRB(550.0, 65.0, 0.0, 0.0),
            items: <PopupMenuItem<String>>[
              new PopupMenuItem<String>(
                  value: 'value01',
                  child: Row(children: <Widget>[
                    Padding(
                        padding: EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 0.0),
                        child: Icon(Icons.chat_bubble_outline)),
                    Text('发起群聊')
                  ])),
              new PopupMenuItem<String>(
                  value: 'value02',
                  child: Row(children: <Widget>[
                    Padding(
                        padding: EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 0.0),
                        child: Icon(Icons.person_add)),
                    Text('添加好友')
                  ])),
              new PopupMenuItem<String>(
                  value: 'value03',
                  child: Row(children: <Widget>[
                    Padding(
                        padding: EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 0.0),
                        child: Icon(Icons.crop_free)),
                    Text('扫一扫')
                  ])),
              new PopupMenuItem<String>(
                  value: 'value04',
                  child: Row(children: <Widget>[
                    Padding(
                        padding: EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 0.0),
                        child: Icon(Icons.check_box)),
                    Text('收付款')
                  ])),
            ]);
      },
      child: Icon(
        Icons.add_circle,
      ),
    );
  }
}
