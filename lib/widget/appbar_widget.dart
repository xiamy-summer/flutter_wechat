import 'package:flutter/material.dart';

/// @author SumMer
/// @date 2019-06-11 01114:58
/// @Description: 标题组件

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  //标题
  String title;

  //appbar的高度
  double height;

  //右边按钮组件
  Widget iconButton;

  //搜索组件
  Widget search;

  //设置阴影
  double shadow;

  //背景颜色
  Color bgcolor;

  AppBarWidget(
      {this.title,
      this.iconButton,
      this.height = 50.0,
      this.search,
      this.shadow = 1,
      this.bgcolor});

  @override
  State<StatefulWidget> createState() {
    return new _AppBarWidgetState();
  }

  @override
  Size get preferredSize => new Size(0, height);
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return new AppBar(
      //沉浸状态栏后需要调整状态栏属性
      brightness: Brightness.light,
      backgroundColor: widget.bgcolor ?? Theme.of(context).appBarTheme.color,
      //appbar的阴影
      elevation: widget.shadow,
      title: new Text(
        widget.title ?? "",
      ),
      actions: <Widget>[
        new Container(
          margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
          child: widget.iconButton ?? null,
        ),
      ],
      centerTitle: true,
      bottom: widget.search,
    );
  }
}
