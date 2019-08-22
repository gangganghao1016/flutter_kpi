import 'dart:async';

import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kpi/common/common.dart';
import 'package:flutter_kpi/routers/fluro_navigator.dart';
import 'package:flutter_kpi/routers/unify_router.dart';
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
    } else {
      _goLogin();
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
    NavigatorUtils.push(context,RouterUnify.login, replace: true);
  }

  _goHome() {
    NavigatorUtils.push(context, RouterUnify.home, replace: true);
  }

  @override
  Widget build(BuildContext context) {
    return  new Scaffold(
        resizeToAvoidBottomInset: false,
        body: new Column());
  }
}
