//
//import 'dart:convert';
//
//import 'package:dio/dio.dart';
//import 'package:flutter_kpi/data/entity_factory.dart';
//import 'package:flutter_kpi/routers/application.dart';
//import 'package:flutter_kpi/routers/fluro_navigator.dart';
//import 'package:flutter_kpi/routers/unify_router.dart';
//import 'package:flutter_kpi/utils/log_util.dart';
//import 'package:rxdart/rxdart.dart';
//
//import 'api.dart';
//import 'base_entity.dart';
//import 'error_handle.dart';
//import 'intercept.dart';
///// @weilu https://github.com/simplezhli
//class DioUtils {
//
//  static final DioUtils _singleton = DioUtils._internal();
//
//  static DioUtils get instance => DioUtils();
//
//  factory DioUtils() {
//    return _singleton;
//  }
//
//  static Dio _dio;
//
//  Dio getDio(){
//    return _dio;
//  }
//
//  DioUtils._internal(){
//    var options = BaseOptions(
//      connectTimeout: 10000,
//      receiveTimeout: 10000,
//      responseType: ResponseType.plain,
//      validateStatus: (status){
//        // 不使用http状态码判断状态，使用AdapterInterceptor来处理（适用于标准REST风格）
//        return true;
//      },
//      baseUrl: Api.baseUrl,
////      contentType: ContentType('application', 'x-www-form-urlencoded', charset: 'utf-8'),
//    );
//    _dio = Dio(options);
//    /// 统一添加身份验证请求头
//    _dio.interceptors.add(AuthInterceptor());
//    /// 刷新Token
//    _dio.interceptors.add(TokenInterceptor());
//    /// 打印Log
//    _dio.interceptors.add(LoggingInterceptor());
//    /// 适配数据
//    _dio.interceptors.add(AdapterInterceptor());
//  }
//
//  // 数据返回格式统一，统一处理异常
//  Future<BaseEntity<T>> _request<T>(String method, String url, {Map<String, dynamic> data, Map<String, dynamic> queryParameters, CancelToken cancelToken, Options options}) async {
//    var response = await _dio.request(url, data: data, queryParameters: queryParameters, options: _checkOptions(method, options), cancelToken: cancelToken);
//
//    int _code;
//    String _msg;
//    T _data;
//
//    try {
//      LogFsUtil.d("_request():"+response.data);
//      Map<String, dynamic> _map = json.decode(response.data.toString());
//      _code = _map["resultCode"];
//      _msg = _map["resultMessage"];
//
//      if (_map.containsKey("data")){
//        if (T.toString() == "String"){
//          _data = _map["data"].toString() as T;
//        }else{
//          _data = EntityFactory.generateOBJ(_map["data"]);
//        }
//      }
//    }catch(e){
//      print(e);
//      return BaseEntity(ExceptionHandle.parse_error, "数据解析错误", _data);
//    }
//    return BaseEntity(_code, _msg, _data);
//  }
//
//  Future<BaseEntity<List<T>>> _requestList<T>(String method, String url, {Map<String, dynamic> data, Map<String, dynamic> queryParameters, CancelToken cancelToken, Options options}) async {
//    var response = await _dio.request(url, data: data, queryParameters: queryParameters, options: _checkOptions(method, options), cancelToken: cancelToken);
//    int _code;
//    String _msg;
//    List<T> _data = [];
//
//    try {
//      Map<String, dynamic> _map = json.decode(response.data.toString());
//      _code = _map["resultCode"];
//      _msg = _map["resultMessage"];
//      if (_map.containsKey("data")){
//        ///  List类型处理，暂不考虑Map
//        (_map["data"] as List).forEach((item){
//          _data.add(EntityFactory.generateOBJ<T>(item));
//        });
//      }
//    }catch(e){
//      print(e);
//      return BaseEntity(ExceptionHandle.parse_error, "数据解析错误", _data);
//    }
//    return BaseEntity(_code, _msg, _data);
//  }
//
//  Options _checkOptions(method, options) {
//    if (options == null) {
//      options = new Options();
//    }
//    options.method = method;
//    return options;
//  }
//
//  Future request<T>(Method method, String url, {Function(T t) onSuccess, Function(int code, String mag) onError, Map<String, dynamic> params, Map<String, dynamic> queryParameters, CancelToken cancelToken, Options options}) async {
//    String m = _getRequestMethod(method);
//    return await _request<T>(m, url,
//        data: params,
//        queryParameters: queryParameters,
//        options: options,
//        cancelToken: cancelToken).then((BaseEntity<T> result){
//      if (result.resultCode == Api.resultCodeSuccess){
//        if (onSuccess != null){
//          onSuccess(result.data);
//        }
//      }else{
//        _onError(result.resultCode, result.resultMessage, onError);
//      }
//    }, onError: (e, _){
//      _cancelLogPrint(e, url);
//      Error error = ExceptionHandle.handleException(e);
//      _onError(error.code, error.msg, onError);
//    });
//  }
//
//  Future requestList<T>(Method method, String url, {Function(List<T> t) onSuccess, Function(int code, String mag) onError, Map<String, dynamic> params, Map<String, dynamic> queryParameters, CancelToken cancelToken, Options options}) async {
//    String m = _getRequestMethod(method);
//    return await _requestList<T>(m, url,
//        data: params,
//        queryParameters: queryParameters,
//        options: options,
//        cancelToken: cancelToken).then((BaseEntity<List<T>> result){
//      if (result.resultCode == Api.resultCodeSuccess){
//        if (onSuccess != null){
//          onSuccess(result.data);
//        }
//      }else{
//        _onError(result.resultCode, result.resultMessage, onError);
//      }
//    }, onError: (e, _){
//      _cancelLogPrint(e, url);
//      Error error = ExceptionHandle.handleException(e);
//      _onError(error.code, error.msg, onError);
//    });
//  }
//
//  /// 统一处理(onSuccess返回T对象，onSuccessList返回List<T>)
//  requestNetwork<T>(Method method, String url, {Function(T t) onSuccess, Function(List<T> list) onSuccessList, Function(int code, String mag) onError,
//    Map<String, dynamic> params, Map<String, dynamic> queryParameters, CancelToken cancelToken, Options options, bool isList : false})async{
//    String m = _getRequestMethod(method);
//    Observable.fromFuture(isList ? _requestList<T>(m, url, data: params, queryParameters: queryParameters, options: options, cancelToken: cancelToken) :
//    _request<T>(m, url, data: params, queryParameters: queryParameters, options: options, cancelToken: cancelToken))
//        .asBroadcastStream()
//        .listen((result){
//      if (result.resultCode == Api.resultCodeSuccess){
//        if (isList){
//          if (onSuccessList != null){
//            onSuccessList(result.data);
//          }
//        }else{
//          if (onSuccess != null){
//            onSuccess(result.data);
//          }
//        }
//      }else{
////        LogFsUtil.e("接口请求异常else:"+result.resultCode.toString()+" "+result.resultMessage);
//        _onError(result.resultCode, result.resultMessage, onError);
//      }
//    }, onError: (e){
//      _cancelLogPrint(e, url);
//      Error error = ExceptionHandle.handleException(e);
//      _onError(error.code, error.msg, onError);
//    });
//  }
//
//  _cancelLogPrint(dynamic e, String url){
//    if (e is DioError && CancelToken.isCancel(e)){
//      LogFsUtil.i("取消请求接口： $url");
//    }
//  }
//
//  _onError(int code, String msg, Function(int code, String mag) onError){
//    LogFsUtil.e("接口请求异常： code: $code, mag: $msg");
//    if(code==Api.resultCodeTokenInvalid){
//      NavigatorUtils.push(Application.context, RouterUnify.login, replace: true,clearStack: true);
//    }
//    if (onError != null) {
//      onError(code, msg);
//    }
//  }
//
//  String _getRequestMethod(Method method){
//    String m;
//    switch(method){
//      case Method.get:
//        m = "GET";
//        break;
//      case Method.post:
//        m = "POST";
//        break;
//      case Method.put:
//        m = "PUT";
//        break;
//      case Method.patch:
//        m = "PATCH";
//        break;
//      case Method.delete:
//        m = "DELETE";
//        break;
//    }
//    return m;
//  }
//}
//
//enum Method {
//  get,
//  post,
//  put,
//  patch,
//  delete,
//}