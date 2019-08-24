import 'package:dio/dio.dart';
import 'package:flutter_kpi/data/base_resp.dart';
import 'package:flutter_kpi/data/user_entity.dart';
import 'package:flutter_kpi/net/api.dart';
import 'package:flutter_kpi/net/net.dart';
import 'package:flutter_kpi/utils/log_util.dart';
class LoginReq {
  String username;
  String password;

  LoginReq(this.username, this.password);

  LoginReq.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
    'username': username,
    'password': password,
  };

  @override
  String toString() {
    return '{' +
        " \"username\":\"" +
        username +
        "\"" +
        ", \"password\":\"" +
        password +
        "\"" +
        '}';
  }
}
class UserRepository {
  Options _checkOptions(method, options) {
    if (options == null) {
      options = new Options();
    }
    options.method = method;
    return options;
  }
//  reqLogin(String username,String password){
//    LoginReq req=new LoginReq(username,password);
//    new Dio(new Options(baseUrl: "http://performance.wxy-zc-forever.com/"))
//        .request(path:Api.login,data:req.toJson(),options:_checkOptions("POST"));
////    Response response = await _dio.request(path,
////        data: data,
////        options: _checkOptions(method, options),
////        cancelToken: cancelToken);
//  }
  Future<UserEntity> login(String username,String password) async {
    Map<String, String> params = Map();
    params["username"] = username;
//    //没有md5
////    params["password"] = Util.generateMd5(password);
    params["password"]=password;
    LoginReq req=new LoginReq(username,password);
    BaseRespR<Map<String, dynamic>> baseResp = await DioUtil()
        .requestR<Map<String, dynamic>>(Method.post, Api.login,
        data: req.toJson());
    LogFsUtil.d("repository:"+baseResp.toString());
    if (baseResp.code != Api.resultCodeSuccess) {
      LogFsUtil.d("repository:"+baseResp.msg);
      return Future.error(baseResp.msg);
    }
    //todo
    baseResp.response.headers.forEach((String name, List<String> values) {
      if (name == "set-cookie") {
        String cookie = values.toString();
        LogFsUtil.e("set-cookie: " + cookie);
//        SpUtil.putString(BaseConstant.keyAppToken, cookie);

        DioUtil().setCookie(cookie);
        //CacheUtil().setLogin(true);
      }
    });
    LogFsUtil.d("repository:model");
    UserEntity model = UserEntity.fromJson(baseResp.data);
    //CacheUtil().setUserModel(model);
//    SpUtil.putObject(BaseConstant.keyUserModel, model);
    //todo
    return model;
  }

//  Future<UserModel> register(RegisterReq req) async {
//    BaseRespR<Map<String, dynamic>> baseResp = await DioUtil()
//        .requestR<Map<String, dynamic>>(
//        Method.post, WanAndroidApi.user_register,
//        data: req.toJson());
//    if (baseResp.code != Constant.status_success) {
//      return Future.error(baseResp.msg);
//    }
//    baseResp.response.headers.forEach((String name, List<String> values) {
//      if (name == "set-cookie") {
//        String cookie = values.toString();
//        LogUtil.e("set-cookie: " + cookie);
//        SpUtil.putString(BaseConstant.keyAppToken, cookie);
//        DioUtil().setCookie(cookie);
//        //CacheUtil().setLogin(true);
//      }
//    });
//    UserModel model = UserModel.fromJson(baseResp.data);
//    //CacheUtil().setUserModel(model);
//    SpUtil.putObject(BaseConstant.keyUserModel, model);
//    return model;
//  }
}
