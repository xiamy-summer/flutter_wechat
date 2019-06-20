import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wechat/model/image_model.dart';
import 'package:wechat/widget/appbar_widget.dart';

/// @author SumMer
/// @date 2019-06-20 02016:47
/// @Description:

class ImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBarWidget(
        title: "预览图片",
      ),
      body: Consumer<ImageModel>(
          builder: (BuildContext context, ImageModel iamge, Widget child) =>
              new Image.file(iamge.getImageFile)),
    );
  }
}
