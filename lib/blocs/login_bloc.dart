import 'package:flustars/flustars.dart';
import 'package:flutter_kpi/common/common.dart';
import 'package:flutter_kpi/data/user_entity.dart';
import 'package:flutter_kpi/utils/log_util.dart';
import 'package:rxdart/rxdart.dart';

import 'bloc_provider.dart';

class LoginBloc extends BaseBloc {
  BehaviorSubject<UserEntity> _repos =
  BehaviorSubject<UserEntity>();
  get _reposSink => _repos.sink;

  get reposStream => _repos.stream;

  @override
  void dispose() {
    super.dispose();
    _repos.close();
  }

  Future<bool> reqLogin(String userName, String password) {
    repository.reqLogin(userName, password).then((user) {
//    _reposList.addAll(list);
//    _reposSink.add(UnmodifiableListView<ReposModel>(_reposList));
    postPageEmpty2PageContent(false, user);
    LogFsUtil.json("userProvider:" + user.toString());
    //把整个user对象放在sp文件中
    if (user != null) SpUtil.putObject(BaseConstant.user_obj, user);
    if (user != null && user.accessToken.isNotEmpty) {
      SpUtil.putString(BaseConstant.access_Token, user.accessToken);
      LogFsUtil.d("存储token到sp");
    }
    return true;
    }).catchError((error) {
    postPageError(false, error.toString());

    });

  }

}
