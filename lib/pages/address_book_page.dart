import 'package:flutter/material.dart';
import 'package:wechat/widget/appbar_widget.dart';
import 'package:wechat/widget/search_widget.dart';

/// @author SumMer
/// @date 2019-06-11 01114:53
/// @Description: 通讯录界面

class AddressBookWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _AddressBookWidgetStatu();
  }
}

class _AddressBookWidgetStatu extends State<AddressBookWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBarWidget(
        title: "通讯录",
        iconButton: Icon(Icons.person_add),
        height: 100.0,
        search: SearchWidget(),
      ),
    );
  }
}
