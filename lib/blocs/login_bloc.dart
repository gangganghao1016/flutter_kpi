import 'package:flutter_kpi/data/user_entity.dart';
import 'package:flutter_kpi/repository/user_repository.dart';
import 'package:flutter_kpi/utils/log_util.dart';
import 'package:rxdart/rxdart.dart';

import 'bloc_provider.dart';

class LoginBloc extends BaseBloc {
  BehaviorSubject<UserEntity> _repos = BehaviorSubject<UserEntity>();

  get _reposSink => _repos.sink;

  get reposStream => _repos.stream;

  @override
  void dispose() {
    super.dispose();
    _repos.close();
  }

  UserRepository _repository=new UserRepository();
  Future<bool> reqLogin(String username,String pwd) async {
    bool isLoginSuccess;
     await _repository.login(username,pwd).then((userEntity) {
      LogFsUtil.d("return...login_____"+userEntity.toString());
      if (userEntity != null) {
        isLoginSuccess=true;
      }
//      _collectListSink.add(UnmodifiableListView<ReposModel>(_collectList));
//      _homeEventSink?.add(new StatusEvent(
//          labelId,
//          ObjectUtil.isEmpty(list)
//              ? RefreshStatus.noMore
//              : RefreshStatus.idle));
//     return isLoginSuccess;
    }).catchError((_) {
      LogFsUtil.d("catchError");
//      if (ObjectUtil.isEmpty(_collectList)) {
//        _collectListBs.sink.addError("error");
//      }
//      _collectPage--;
//      _homeEventSink?.add(new StatusEvent(labelId, RefreshStatus.failed));
    });
    LogFsUtil.d("return...");
     return isLoginSuccess;
  }

//  reqlogin(String userName, String password) {
//    Map<String, String> params = Map();
//    params["username"] = userName;
//    //没有md5
////    params["password"] = Util.generateMd5(password);
//    params["password"] = password;
////    WidgetsBinding.instance.addPostFrameCallback((_){
//    /// 接口请求例子
//    /// get请求参数queryParameters  post请求参数params
//    repository.requestNetwork<UserEntity>(Method.post,
//        params: params, url: Api.login, onSuccess: (user) {
//      LogFsUtil.d("respository_onSuccess:" + user.toString());
//      //把整个user对象放在sp文件中
//      if (user != null){
//        SpUtil.putObject(BaseConstant.user_obj, user);
//      }
//      if (user != null && user.accessToken.isNotEmpty) {
//        SpUtil.putString(BaseConstant.access_Token, user.accessToken);
//        LogFsUtil.d("存储token到sp");
//      }
//      //
//
//    }, onError: (code, msg) {
//      LogFsUtil.d("respository_onError:" + msg);
////    return new Future.error(msg);
//    });
//    LogFsUtil.d("respository  return");
//  }
//
//  Future<bool> reqLogin(String userName, String password) async {
//    bool isSuccess = false;
//    repository.reqLogin(userName, password).then((user) {
////    LogFsUtil.d("login_bloc_then....");
////    postPageEmpty2PageContent(false, user);
//      LogFsUtil.d("userProvider:" + user.toString());
//      //把整个user对象放在sp文件中
//      if (user != null) SpUtil.putObject(BaseConstant.user_obj, user);
//      if (user != null && user.accessToken.isNotEmpty) {
//        SpUtil.putString(BaseConstant.access_Token, user.accessToken);
//        LogFsUtil.d("存储token到sp");
//      }
//      isSuccess = true;
//    }).catchError((error) {
//      return new Future.error(error);
////    postPageError(false, error.toString());
////      Toast.show(error);
//    });
//    return isSuccess;
//  }
}
