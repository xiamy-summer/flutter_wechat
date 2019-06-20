import 'dart:io';

import 'package:flutter/material.dart';

/// @author SumMer
/// @date 2019-06-20 02015:29
/// @Description:

class ImageModel with ChangeNotifier {
  File _imageFile;

  //类似java的get方法
  File get getImageFile => _imageFile;

  //类似java的set方法
  void setImageFile(File numerator) {
    this._imageFile = numerator;
    //通知所有听众进行刷新
    notifyListeners();
  }
}
