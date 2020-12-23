import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:oktoast/oktoast.dart';

//http工具类
class HttpUtil {

  //服务根地址
  static final baseUrl="";//接口地址



  //http接口跟地址
  static final httpBaseUrl="http://$baseUrl";

  //单例模式
  static HttpUtil instance;
  //dio实例
  static Dio dio;
  //基础配置
  static BaseOptions options;
  //数据缓存配置
  static Options cacheOptions=buildCacheOptions(Duration(seconds: 1),maxStale: Duration(days: 7));

  static HttpUtil getInstance(){
    if( HttpUtil.instance==null){
      HttpUtil.instance=_httpUtil();
    }
    return  HttpUtil.instance;
  }

  /*
   * 实例初始化配置
   */
  static _httpUtil() {
    //BaseOptions、Options、RequestOptions 都可以配置参数，优先级别依次递增，且可以根据优先级别覆盖参数
    HttpUtil.options = BaseOptions(
      //请求基地址
      baseUrl: httpBaseUrl,
      //连接超时，单位--毫秒.
      connectTimeout: 10000,
      //响应流间隔时间，单位为毫秒。
      receiveTimeout: 5000,
      //请求的Content-Type，默认值"application/json; charset=utf-8",Headers.formUrlEncodedContentType自动编码请求体.
      contentType: Headers.formUrlEncodedContentType,
      //接受响应数据格式,四种类型 `json`, `stream`, `plain`, `bytes`. 默认值 `json`,
      responseType: ResponseType.json,
      //请求编码加密
      requestEncoder: null,
    );
    HttpUtil.dio = Dio(options);
    //添加请求,响应,错误拦截器
    HttpUtil.dio.interceptors.add(InterceptorsWrapper(onRequest: _onRequest, onResponse: _onResponse, onError: _onError));
    //数据缓存拦截器
    HttpUtil.dio.interceptors.add(DioCacheManager(CacheConfig(baseUrl: httpBaseUrl)).interceptor);
    return HttpUtil();
  }

  /*
   * get请求
   */
  Future<Response> get(String url, {Map<String, dynamic> data,Options options}) async {
    Response response;
    try {
      response =await dio.get(
          url,
          queryParameters: data,
          options:options,
          cancelToken: CancelToken()
      );
    } on DioError catch (e) {
      print("get erro---------$e");
    }
    return response;
  }

  /*
   * post请求
   */
  Future<Response> post(String url, {Map<String, dynamic> data,String plainData,Options options}) async {
   Response response;
    try {
      response = await dio.post(
          url,
          data:plainData,
          queryParameters: data,
          options:options,
          cancelToken: CancelToken()
      );
    } on DioError catch (e) {
      print("post erro---------$e");
    }
    return response;
  }

  /*
   *文件上传
   */
  Future<Response> uploadFile(url, {data,Options options}) async {
    Response response;
    try {
      response =await dio.post(
          url,
          data: data,
          options:options,
          cancelToken: CancelToken()
      );
    } on DioError catch (e) {
      print("post erro---------$e");
    }
    return response;
  }


  /*
   * 下载文件
   */
  Future<Response> downloadFile(urlPath, savePath) async {
    Response response;
    try {
      response = await dio.download(
        urlPath,
        savePath,
        onReceiveProgress: (int count, int total) {
          //进度
          print("$count $total");
        },
        cancelToken: CancelToken(),
      );
    } on DioError catch (e) {
      print('downloadFile error---------$e');
    }
    return response.data;
  }

  //请求拦截器
  static _onRequest(RequestOptions options) async {
    //显示加载动画
    EasyLoading.show();
  }

  //响应拦截
  static _onResponse(Response response) async {
    //关闭加载动画
    EasyLoading.dismiss();
  }

  //异常拦截
  static _onError(DioError e) {
    //关闭加载动画
    EasyLoading.dismiss();
    if (e.type == DioErrorType.CONNECT_TIMEOUT) {
      showToast("连接超时");
    } else if (e.type == DioErrorType.SEND_TIMEOUT) {
      showToast("请求超时");
    } else if (e.type == DioErrorType.RECEIVE_TIMEOUT) {
      showToast("响应超时");
    } else if (e.type == DioErrorType.RESPONSE) {
      showToast("出现异常");
    } else if (e.type == DioErrorType.CANCEL) {
      showToast("取消请求");
    } else {
      showToast("网络出错");
    }
  }
}
