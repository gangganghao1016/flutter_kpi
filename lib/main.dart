import 'package:fluro/fluro.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kpi/blocs/application_bloc.dart';
import 'package:flutter_kpi/blocs/bloc_index.dart';
import 'package:flutter_kpi/blocs/bloc_provider.dart';
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
