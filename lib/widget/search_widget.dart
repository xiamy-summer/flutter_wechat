import 'package:flutter/material.dart';

/// @author SumMer
/// @date 2019-06-11 01117:08
/// @Description:

class SearchWidget extends StatefulWidget implements PreferredSizeWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _SearchWidgetState();
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => null;
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PreferredSize(
      child: GestureDetector(
        onTap: () {
          print("111");
        },
        child: new Container(
          margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
          decoration: BoxDecoration(
            color: Colors.white,
            //边角圆度
            borderRadius: BorderRadius.circular(5.0),
          ),
          height: 35,
          padding:
              EdgeInsets.only(left: 2.0, right: 2.0, top: 0.0, bottom: 5.0),
          child: new Center(
            child: FlatButton.icon(
              onPressed: null,
              icon: Icon(Icons.search),
              label: new Text(
                "搜索",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ),
          ),
        ),
      ),
      preferredSize: Size(0, 50),
    );
  }
}
