class ResultData {
  var data;

  /// true 请求成功 false 请求失败，show data
  bool resultCode = false;

  //状态码
  int stateCode;

  ResultData(this.data, this.resultCode, this.stateCode);
}
