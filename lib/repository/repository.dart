import 'package:dio/dio.dart';
import 'package:flutter_kpi/data/user_entity.dart';
import 'package:flutter_kpi/net/net.dart';
import 'package:flutter_kpi/utils/log_util.dart';
import 'package:flutter_kpi/utils/toast.dart';
import 'package:meta/meta.dart';

class Repository {
  /// 返回Future 适用于刷新，加载更多
  Future request<T>(Method method, {@required String url, bool isShow : true, bool isClose: true, Function(T t) onSuccess, Function(int code, String mag) onError, Map<String, dynamic> params, Map<String, dynamic> queryParameters, CancelToken cancelToken, Options options}) async {
//    if (isShow) view.showProgress();
    await DioUtils.instance.request<T>(method, url,
        params: params,
        queryParameters: queryParameters,
        options: options,
//        cancelToken: cancelToken?? _cancelToken,
        onSuccess: (data){
//          if (isClose) view.closeProgress();
          if (onSuccess != null) {
            onSuccess(data);
          }
        },
        onError: (code, msg){
//          _onError(code, msg, onError);
        }
    );
  }
  Future requestNetwork<T>(Method method, {@required String url, bool isShow : true, bool isClose: true, Function(T t) onSuccess, Function(List<T> list) onSuccessList, Function(int code, String mag) onError,
    Map<String, dynamic> params, Map<String, dynamic> queryParameters, CancelToken cancelToken, Options options, bool isList : false}) async{
//    if (isShow) view.showProgress();
   await DioUtils.instance.requestNetwork<T>(method, url,
        params: params,
        queryParameters: queryParameters,
        options: options,
//        cancelToken: cancelToken?? _cancelToken,
        isList: isList,
        onSuccess: (data){
//          if (isClose) view.closeProgress();
          if (onSuccess != null) {
            onSuccess(data);
          }
        },
        onSuccessList: (data){
//          if (isClose) view.closeProgress();
          if (onSuccessList != null) {
            onSuccessList(data);
          }
        },
        onError: (code, msg){
          Toast.show(msg);
      if(onError!=null){
        onError(code,msg);
      }
//          _onError(code, msg, onError);
        }
    );
  }
  Future<UserEntity> reqLogin(String userName,String password) async{
    Map<String, String> params = Map();
    params["username"] = userName;
    //没有md5
//    params["password"] = Util.generateMd5(password);
    params["password"]=password;
//    WidgetsBinding.instance.addPostFrameCallback((_){
      /// 接口请求例子
      /// get请求参数queryParameters  post请求参数params
    UserEntity userEntity;
     await requestNetwork<UserEntity>(Method.post,
        params: params,
        url: Api.login,
        onSuccess: (user){
          LogFsUtil.d("respository_onSuccess:" + user.toString());
       userEntity=user;
        },
        onError:(code, msg) {
        LogFsUtil.d("respository_onError:"+msg);
      return new Future.error(msg);
        }
      );
      LogFsUtil.d("respository  return");

    return userEntity;
//    });

  }
//  Future<List<ReposModel>> getListDimens(int page) async {
//    BaseResp<Map<String, dynamic>> baseResp = await DioUtil()
//        .request<Map<String, dynamic>>(
//            Method.get,
//            WanAndroidApi.getPath(
//                path: WanAndroidApi.ARTICLE_LISTPROJECT, page: page));
//    List<ReposModel> list;
//    if (baseResp.code != Constant.status_success) {
//      return new Future.error(baseResp.msg);
//    }
//    if (baseResp.data != null) {
//      ComData comData = ComData.fromJson(baseResp.data);
//      list = comData.datas.map((value) {
//        return ReposModel.fromJson(value);
//      }).toList();
//    }
//    return list;
//  }

//  Future<UserEntity> login(LoginReq req) async {
//    BaseRespR<Map<String, dynamic>> baseResp = await DioUtil()
//        .requestR<Map<String, dynamic>>(Method.post, WanAndroidApi.user_login,
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
