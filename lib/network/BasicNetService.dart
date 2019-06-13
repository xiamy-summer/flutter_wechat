export 'MSNetService.dart';
import 'MSNetService.dart';

class BasicNetService extends MSNetService {
  String url;
  Method method;
  Map<String, dynamic> headers;

  BasicNetService({this.headers});

  @override
  request(String url,
      {Method method,
      Object params,
      var file,
      String fileName,
      String fileSavePath}) {
    // TODO: implement request
    this.url = url;
    this.method = method;

    /// 传参进行统一处理
    Map newParams = {};
    return super.request(url,
        method: method,
        params: newParams,
        file: file,
        fileName: fileName,
        fileSavePath: fileSavePath);
  }

  @override
  getBasicUrl() {
    return "http://192.168.3.235:7002/maxrest/rest/";
  }

  getHeaders() async {
    return this.headers;
  }
}
