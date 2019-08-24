import 'package:dio/dio.dart';
import 'package:fluro/fluro.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kpi/blocs/application_bloc.dart';
import 'package:flutter_kpi/blocs/bloc_index.dart';
import 'package:flutter_kpi/blocs/bloc_provider.dart';
import 'package:flutter_kpi/common/component_index.dart';
import 'package:flutter_kpi/net/net.dart';
import 'package:flutter_kpi/res/colors.dart';
import 'package:flutter_kpi/routers/application.dart';
import 'package:flutter_kpi/routers/routers.dart';
import 'package:flutter_kpi/ui/page/user_login_page.dart';
import 'package:oktoast/oktoast.dart';

//void main() => runApp(MyApp());
void main() => runApp(BlocProvider<ApplicationBloc>(
  bloc: ApplicationBloc(),
  child: MyApp()
));

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}
class MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _initAsync();
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
    Application.context=context;
  }

  void _initAsync() async {
    await SpUtil.getInstance();
    if (!mounted) return;
    _init();
  }

  void _init() {
//    DioUtil.openDebug();
    Options options = DioUtil.getDefOptions();
    options.baseUrl = Api.baseUrl;
    String cookie = SpUtil.getString(BaseConstant.access_Token);
    if (ObjectUtil.isNotEmpty(cookie)) {
      Map<String, dynamic> _headers = new Map();
      _headers["accessToken"] = cookie;
      options.headers = _headers;
    }
    HttpConfig config = new HttpConfig(options: options);
    DioUtil().setConfig(config);
  }

  @override
  Widget build(BuildContext context) {
    return OKToast(
        child: MaterialApp(
          title: 'Flutter Kpi',
          //debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Colours.app_main,
            scaffoldBackgroundColor: Colors.white,
          ),
//          home: SplashPage(),
          home: BlocProvider(child: UserLoginPage(), bloc: LoginBloc()),
          onGenerateRoute: Application.router.generator,
        ),
        backgroundColor: Colors.black54,
        textPadding:
        const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        radius: 20.0,
        position: ToastPosition.bottom);
  }

}
