import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wechat/pages/botton_navigation.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  runApp(
    new MaterialApp(
      theme: new ThemeData(
        scaffoldBackgroundColor: Colors.grey[200],
        appBarTheme: AppBarTheme(
          color: Colors.grey[200],
          //尾部icons图标主题
          actionsIconTheme: IconThemeData(color: Colors.black87),
          //icons图标主题
          iconTheme: IconThemeData(color: Colors.black87),
          //文字格式
          textTheme: TextTheme(
            title: TextStyle(
                color: Colors.black87,
                fontSize: 20,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
      //消除右上角的debug图标
      debugShowCheckedModeBanner: false,
      //初始路由
      initialRoute: '/',
      home: new BottomNavigationWidget(),
    ),
  );
  if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，
    // 是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}
