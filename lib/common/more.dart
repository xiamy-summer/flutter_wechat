import 'package:flutter/material.dart';
/// @author SumMer
/// @date 2019-05-31 03116:20
/// @Description: 加载控件

/*
   * 加载更多时显示的组件,给用户提示
   */

class MoreWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _getMoreWidget();
  }

}

Widget _getMoreWidget() {
  return Center(
    child: Padding(
      padding: EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            '加载中...',
            style: TextStyle(fontSize: 16.0),
          ),
          CircularProgressIndicator(
            strokeWidth: 1.0,
          )
        ],
      ),
    ),
  );
}
