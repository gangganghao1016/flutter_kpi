import 'package:flutter/material.dart';
import 'package:flutter_kpi/blocs/login_bloc.dart';
import 'package:flutter_kpi/res/index.dart';
import 'package:flutter_kpi/ui/base_widget.dart';
import 'package:flutter_kpi/ui/widget/widgets.dart';
import 'package:flutter_kpi/utils/toast.dart';

class UserLoginPageTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginStateTest();
  }
}

class LoginStateTest extends State<UserLoginPageTest> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _controllerName = new TextEditingController();
    TextEditingController _controllerPwd = new TextEditingController();
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
                hintText: "pwdlogin",
//                    obscureText: true,
              ),
//                  new RoundCircleButton(
//                    text: StringIds.user_login,
//                    margin: EdgeInsets.only(
//                        left: Dimens.gap_dp30,
//                        top: Dimens.gap_dp40,
//                        right: Dimens.gap_dp30),
//                    onPressed: () {
////                      _userLogin();
//                    },
//                  ),
            ],
          ),
        )
      ],
    ));
  }
}

class UserLoginPage extends BaseWidget {
  @override
  BaseState<BaseWidget, LoginBloc> getState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends BaseState<UserLoginPage, LoginBloc> {
  @override
  Widget buildWidget(BuildContext context) {
    showLoadSuccess();
    TextEditingController _controllerName = new TextEditingController();
    TextEditingController _controllerPwd = new TextEditingController();

    void _userLogin() {
      String username = _controllerName.text;
      String password = _controllerPwd.text;
      if (username.isEmpty || username.length < 3) {
        Toast.show(username.isEmpty ? "请输入用户名～" : "用户名至少3位～");
        return;
      }
      if (password.isEmpty || password.length < 6) {
        Toast.show(username.isEmpty ? "请输入密码～" : "密码至少6位～");
        return;
      }
      bloc.reqlogin(username, password);
//      bloc.reqLogin(username, password).then((yes) {
//        if (yes) {
//          NavigatorUtils.push(context, RouterUnify.home);
//        }
//      });
    }

    return new Scaffold(
        resizeToAvoidBottomInset: false,
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
                    hintText: StringIds.hint_user_name,
                  ),
                  Gaps.vGap15,
                  LoginItem(
                    hasSuffixIcon: true,
                    controller: _controllerPwd,
                    prefixIcon: Icons.lock,
                    hintText: StringIds.hint_user_pwd,
//                    obscureText: true,
                  ),
                  new RoundCircleButton(
                    text: StringIds.user_login,
                    margin: EdgeInsets.only(
                        left: Dimens.gap_dp30,
                        top: Dimens.gap_dp40,
                        right: Dimens.gap_dp30),
                    onPressed: () {
                      _userLogin();
                    },
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
