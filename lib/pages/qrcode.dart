import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:wechat/widget/appbar_widget.dart';

/// @author SumMer
/// @date 2019-06-26 02617:08
/// @Description:二维码界面

class QrCode extends StatelessWidget {
  String context;

  double size;

  QrCode(this.context, {this.size = 100});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBarWidget(
        title: "我的二维码",
        shadow: 0.0,
        iconButton: new Icon(Icons.more_horiz),
      ),
      body: new Center(
        child: new Container(
          alignment: Alignment.center,
          height: 450.0,
          width: 400.0,
          decoration: BoxDecoration(
            color: Colors.white,
            //边角圆度
            borderRadius: BorderRadius.circular(10.0),
            // 生成俩层阴影，一层绿，一层黄， 阴影位置由offset决定,
            // 阴影模糊层度由blurRadius大小决定（大就更透明更扩散），
            // 阴影模糊大小由spreadRadius决定
            boxShadow: [
              BoxShadow(blurRadius: 0.5, spreadRadius: 0.0),
            ],
          ),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new QrImage(
                  data: this.context,
                  size: this.size,
                  errorCorrectionLevel: QrErrorCorrectLevel.M),
            ],
          ),
        ),
      ),
    );
  }
}
