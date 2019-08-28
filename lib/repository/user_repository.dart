import 'package:flutter_kpi/common/component_index.dart';
import 'package:flutter_kpi/data/base_resp.dart';
import 'package:flutter_kpi/data/user_entity.dart';
import 'package:flutter_kpi/net/api.dart';
import 'package:flutter_kpi/net/net.dart';
import 'package:flutter_kpi/utils/util_index.dart';

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
  Future<UserEntity> login(String username, String password) async {
    Map<String, String> params = Map();
    params["username"] = username;
//    //没有md5
////    params["password"] = Util.generateMd5(password);
    params["password"] = password;
    LoginReq req = new LoginReq(username, password);
    BaseRespR<Map<String, dynamic>> baseResp = await DioUtil()
        .requestR<Map<String, dynamic>>(Method.post, Api.login,
            data: req.toJson());
    LogFsUtil.d("repository:" + baseResp.toString());
    if (baseResp.code != Api.resultCodeSuccess) {
      LogFsUtil.d("repository:" + baseResp.msg);
      Toast.show(baseResp.msg);
      return Future.error(baseResp.msg);
    }
    UserEntity model = UserEntity.fromJson(baseResp.data);
    if (model != null) {
      //      //把整个user对象放在sp文件中
      SpUtil.putObject(BaseConstant.user_obj, model);
      if (model.accessToken.isNotEmpty) {
        SpUtil.putString(BaseConstant.access_Token, model.accessToken);
        LogFsUtil.d("存储token到sp");
        DioUtil.getInstance().setCookie(model.accessToken);
      }
      Toast.show("登录成功");
    }
    return model;
  }
}
