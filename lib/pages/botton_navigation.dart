import 'package:flutter/material.dart';
import 'package:wechat/pages/address_book_page.dart';
import 'package:wechat/pages/discover_page.dart';
import 'package:wechat/pages/home_page.dart';
import 'package:wechat/pages/mine_page.dart';

//底部导航栏
class BottomNavigationWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BottomNavigationWidgetState();
  }
}

//底部导航栏
class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  int _currentIndex = 0;

  List<Widget> pageList = new List();
  static double itemSize = 25.0;

  //初始化
  @override
  void initState() {
    super.initState();
    pageList
      ..add(HomePageWidget())
      ..add(AddressBookWidget())
      ..add(DiscoverWidget())
      ..add(MinePageWidget());
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: pageList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/tabbar_mainframe@3x.png",
              width: itemSize,
              height: itemSize,
            ),
            activeIcon: Image.asset(
              "assets/tabbar_mainframeHL@3x.png",
              width: itemSize,
              height: itemSize,
            ),
            title: new Text(
              "微信",
            ),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/tabbar_contacts@3x.png",
              width: itemSize,
              height: itemSize,
            ),
            activeIcon: Image.asset(
              "assets/tabbar_contactsHL@3x.png",
              width: itemSize,
              height: itemSize,
            ),
            title: new Text(
              "通讯录",
            ),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/tabbar_discover@3x.png",
              width: itemSize,
              height: itemSize,
            ),
            activeIcon: Image.asset(
              "assets/tabbar_discoverHL@3x.png",
              width: itemSize,
              height: itemSize,
            ),
            title: new Text(
              "发现",
            ),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/tabbar_me@3x.png",
              width: itemSize,
              height: itemSize,
            ),
            activeIcon: Image.asset(
              "assets/tabbar_meHL@3x.png",
              width: itemSize,
              height: itemSize,
            ),
            title: new Text(
              "我",
            ),
          ),
        ],
        //这是底部导航栏自带的位标属性，表示底部导航栏当前处于哪个导航标签。
        // 给他一个初始值0，也就是默认第一个标签页面。
        currentIndex: _currentIndex,
        //点击底部导航栏变更状态
        onTap: (int i) async {
          setState(() {
            _currentIndex = i;
          });
        },
      ),
    );
  }
}
