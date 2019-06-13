import 'package:dio/dio.dart';
import 'MSSessionManager.dart';
import 'ResultData.dart';
import 'dart:convert';

enum Method {
  GET,
  POST,
  DELETE,
  PUT,
  UPLOAD,
  DOWNLOAD,
}

class MSNetService {
  /// get请求
  get(String url, {Object params}) async {
    return await request(url, method: Method.GET);
  }

  /// post请求
  post(String url, {Object params}) async {
    return await request(url, method: Method.POST, params: params);
  }

  /// delete请求
  delete(String url, {Object params}) async {
    return await request(url, method: Method.DELETE);
  }

  /// put请求
  put(String url, {Object params}) async {
    return await request(url, method: Method.PUT, params: params);
  }

  /// 附件上传
  upLoad(
    var file,
    String fileName,
    String url, {
    Object params,
  }) async {
    return await request(url,
        method: Method.UPLOAD, params: params, file: file, fileName: fileName);
  }

  /// 附件下载
  download(String url, String savePath) async {
    return await request(url, method: Method.DOWNLOAD, fileSavePath: savePath);
  }

  ///  请求部分
  request(String url,
      {Method method,
      Object params,
      var file,
      String fileName,
      String fileSavePath}) async {
    try {
      Response response;
      MSSessionManager sessionManager = MSSessionManager();
      var headers = await getHeaders();
      if (headers != null) {
        sessionManager.options.headers = headers;
      }
      var baseUrl = await getBasicUrl();
      sessionManager.options.baseUrl = baseUrl;
      switch (method) {
        case Method.GET:
          response = await sessionManager.get(url);
          break;
        case Method.POST:
          response = await sessionManager.post(url, data: params);
          break;
        case Method.DELETE:
          response = await sessionManager.delete(url);
          break;
        case Method.PUT:
          response = await sessionManager.put(url, data: params);
          break;
        case Method.UPLOAD:
          {
            FormData formData = new FormData();
            if (params != null) {
              formData = FormData.from(params);
            }
            formData.add(
                "files", UploadFileInfo.fromBytes(file, fileName + '.png'));
            response = await sessionManager.post(url, data: formData);
            break;
          }
        case Method.DOWNLOAD:
          response = await sessionManager.download(url, fileSavePath);
          break;
      }
      return await handleDataSource(response, method);
    } catch (exception) {
      return ResultData(exception.toString(), false, 500);
    }
  }

  /// 数据处理
  static handleDataSource(Response response, Method method) {
    String errorMsg = "";
    int statusCode;
    statusCode = response.statusCode;
    if (method == Method.DOWNLOAD) {
      if (statusCode == 200) {
        /// 下载成功
        return ResultData('下载成功', true, response.statusCode);
      } else {
        /// 下载失败
        return ResultData('下载失败', false, response.statusCode);
      }
    }
    //处理错误部分
    if (statusCode < 0) {
      errorMsg = "网络请求错误,状态码:" + statusCode.toString();
      return ResultData(errorMsg, false, response.statusCode);
    }
    try {
      if (response.data.toString().isNotEmpty) {
        Map data = json.decode(response.data);
        //判断返回的code
        if (data['code'] == 0) {
          try {
            return ResultData(data['data'], true, response.statusCode);
          } catch (exception) {
            return ResultData('暂无数据', false, response.statusCode);
          }
        } else {
          return ResultData(data, true, response.statusCode);
        }
      }
    } catch (exception) {
      print("异常：$exception");
      List data = json.decode(response.data);
      return ResultData(data, true, response.statusCode);
    }
  }

  getHeaders() {
    return null;
  }

  getBasicUrl() {
    return null;
  }
}
