import 'package:flutter/material.dart';
import 'package:wechat/widget/appbar_widget.dart';

/// @author SumMer
/// @date 2019-06-17 01716:09
/// @Description: 支付页面

class Pay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBarWidget(
        title: "支付",
        iconButton: Icon(Icons.more_horiz),
        bgcolor: Colors.grey[50],
        shadow: 0.0,
      ),
      body: new ListView(
        children: <Widget>[
          new Card(
            //设置阴影
            elevation: 0.0,
            color: Colors.green,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new Container(
                  padding: EdgeInsets.only(top: 40.0, bottom: 40.0),
                  child: new Column(
                    children: <Widget>[
                      new Image.asset(
                        "assets/mine/WCPayOfflinePay.png",
                      ),
                      new Text(
                        "收付款",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                new Container(
                  padding: EdgeInsets.only(top: 40.0, bottom: 40.0),
                  child: new Column(
                    children: <Widget>[
                      new Image.asset(
                        "assets/mine/installed.png",
                      ),
                      new Text(
                        "收付款",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          ServicesWidget("腾讯服务"),
          ServicesWidget("第三方服务"),
        ],
      ),
    );
  }
}

///服务
class ServicesWidget extends StatefulWidget {
  String titleContex;

  ServicesWidget(this.titleContex);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return titleContex == '腾讯服务'
        ? new _TencentServicesWidgetState()
        : new _ThirdPartyServicesWidgetState();
  }
}

Widget _individualServices(String image, String textconten) {
  return FlatButton(
    child: new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Image.asset(image),
        new Padding(padding: EdgeInsets.only(top: 10.0)),
        new Text(textconten),
      ],
    ),
    onPressed: () {
      print(textconten);
    },
  );
}

//腾讯服务
class _TencentServicesWidgetState extends State<ServicesWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Card(
      elevation: 0.5,
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0, bottom: 15.0),
            child: new Text(widget.titleContex),
          ),
          new Divider(height: 0.0),
          new Container(
            child: new GridView.count(
              //每行显示数量
              crossAxisCount: 3,
              //左右边距
              crossAxisSpacing: 2,
              //上下边距
              mainAxisSpacing: 2,
              //显示比例
              childAspectRatio: 1.0,
              // 处理listview嵌套报错
              shrinkWrap: true,
              // 处理GridView中滑动父级Listview无法滑动
              physics: new NeverScrollableScrollPhysics(),
              children: <Widget>[
                _individualServices(
                    "assets/mine/Credit_card_payment.png", "信用卡还款"),
                _individualServices("assets/mine/borrow_money.png", "微粒贷借钱"),
                _individualServices(
                    "assets/mine/phone_replenishing.png", "手机充值"),
                _individualServices("assets/mine/finance.png", "理财通"),
                _individualServices("assets/mine/qb_recharge.png", "Q币充值"),
                _individualServices("assets/mine/city_services.png", "城市服务"),
                _individualServices("assets/mine/public_welfare.png", "腾讯公益"),
                _individualServices("assets/mine/Insurance.png", "保险服务"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ThirdPartyServicesWidgetState extends State<ServicesWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Card(
      elevation: 0.5,
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0, bottom: 15.0),
            child: new Text(widget.titleContex),
          ),
          new Divider(height: 0.0),
          new Container(
            child: new GridView.count(
              //每行显示数量
              crossAxisCount: 3,
              //左右边距
              crossAxisSpacing: 2,
              //上下边距
              mainAxisSpacing: 2,
              //显示比例
              childAspectRatio: 1.0,
              // 处理listview嵌套报错
              shrinkWrap: true,
              // 处理GridView中滑动父级Listview无法滑动
              physics: new NeverScrollableScrollPhysics(),
              children: <Widget>[
                _individualServices("assets/mine/didi.png", "滴滴出行"),
                _individualServices("assets/mine/jd.png", "京购"),
                _individualServices("assets/mine/meituan.png", "美团外卖"),
                _individualServices("assets/mine/maoyan.png", "电影演出赛事"),
                _individualServices("assets/mine/dazong.png", "吃喝玩乐"),
                _individualServices("assets/mine/pinduoduo.png", "拼多多"),
                _individualServices("assets/mine/mogujie.png", "蘑菇街女装"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
