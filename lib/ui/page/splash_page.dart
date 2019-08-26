import 'dart:async';

import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kpi/common/common.dart';
import 'package:flutter_kpi/routers/fluro_navigator.dart';
import 'package:flutter_kpi/routers/unify_router.dart';
import 'package:flutter_kpi/utils/utils.dart';
import 'package:rxdart/rxdart.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashState();
  }
}

class SplashState extends State<SplashPage> {
  StreamSubscription _subscription;

  void _initAsync() async {
    await SpUtil.getInstance();
    String accessToken = SpUtil.getString(BaseConstant.access_Token);
    if (accessToken.isNotEmpty) {
     _goHome();
      // _goLogin();
    } else {
       _goLogin();
//      _goHome();
    }
  }

  @override
  void initState() {
    super.initState();
    _initSplash();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  void _initSplash() {
    _subscription =
        Observable.just(1).delay(Duration(milliseconds: 2000)).listen((_) {
      _initAsync();
    });
  }

  _goLogin() {
    NavigatorUtils.push(context, RouterUnify.login,
        replace: true, clearStack: true);
    /* Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) {
      return UserLoginPageTest();
    }));
*/
  }

  Widget _buildSplashBg() {
    return new Image.asset(
      Util.getImgPath('spl_img'),
      width: double.infinity,
      fit: BoxFit.fill,
      height: double.infinity,
    );
  }

  _goHome() {
    NavigatorUtils.push(context, RouterUnify.home, replace: true);
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: _buildSplashBg(),
      width: double.infinity,
      height: double.infinity,
    );
//    return  new Scaffold(
//        resizeToAvoidBottomInset: false,
//        body: new Column()
//    );
  }
}
