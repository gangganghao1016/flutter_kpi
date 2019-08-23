import 'package:fluro/fluro.dart';
import 'package:flutter_kpi/blocs/bloc_index.dart';
import 'package:flutter_kpi/routers/router_init.dart';
import 'package:flutter_kpi/ui/page/user_login_page.dart';

class RouterUnify extends IRouterProvider{
 static String home="/home";
 static String login="/login";
  @override
  void initRouter(Router router) {
//   router.define(home, handler: Handler(handlerFunc: (_, params) => HomePage()));
//   router.define(login, handler: Handler(handlerFunc: (_, params) => UserLoginPageTest()));
   router.define(login, handler: Handler(handlerFunc: (_, params) => BlocProvider(child: UserLoginPage(), bloc: LoginBloc())));
  }

}