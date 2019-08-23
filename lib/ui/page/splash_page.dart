import 'dart:async';

import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kpi/common/common.dart';
import 'package:flutter_kpi/res/index.dart';
import 'package:flutter_kpi/routers/fluro_navigator.dart';
import 'package:flutter_kpi/routers/unify_router.dart';
import 'package:flutter_kpi/ui/widget/widgets.dart';
import 'package:rxdart/rxdart.dart';

import 'user_login_page.dart';

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
//      _goLogin();
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
//    NavigatorUtils.push(context,RouterUnify.login, replace: false);
    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) {
      return UserLoginPageTest();
    }))
    ;

  }

  _goHome() {
    NavigatorUtils.push(context, RouterUnify.home, replace: true);
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _controllerName=new TextEditingController();
    TextEditingController _controllerPwd=new TextEditingController();
    return new Scaffold(
//        resizeToAvoidBottomInset: false,
        body: new Column(
          children: <Widget>[
            new Container(
              margin: EdgeInsets.only(
                  left: Dimens.gap_dp20, top: 100, right: Dimens.gap_dp20),
              child: new Column(
                children: <Widget>[
                  LoginItem(
                    controller: _controllerName,
                    prefixIcon: Icons.person,
                    hintText: "textname",
                  ),
//                  Gaps.vGap15,
//                  TextField(controller: _controllerPwd,),
                  LoginItem(
                    controller: _controllerPwd,
                    prefixIcon: Icons.lock,
                    hintText: "pwd",
//                    obscureText: true,
                  ),
//                  new RoundCircleButton(
//                    text: StringIds.user_login,
//                    margin: EdgeInsets.only(
//                        left: Dimens.gap_dp30,
//                        top: Dimens.gap_dp40,
//                        right: Dimens.gap_dp30),
//                    onPressed: () {
//                      _userLogin();
//                    },
//                  ),
                ],
              ),
            )
          ],
        ));
//    return  new Scaffold(
//        resizeToAvoidBottomInset: false,
//        body: new Column()
//    );
  }
}
