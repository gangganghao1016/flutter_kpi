
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter/services.dart';
import 'package:flutter_kpi/net/net.dart';
=======
import 'package:flutter_kpi/utils/util_index.dart';
import 'package:flutter_kpi/common/component_index.dart';
>>>>>>> faed70b45a216702ff3c84c45039109d299069ae
import 'package:oktoast/oktoast.dart';
import 'package:rxdart/rxdart.dart';

class MineWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MineState();
}

class _MineState extends State<MineWidget> with SingleTickerProviderStateMixin {

  Map<String, Object> userInfo;

  @override
  void initState() {
    super.initState();
    userInfo = SpUtil.getObject(BaseConstant.access_Token);
    LogFsUtil.e(userInfo.toString());
  }

  @override
  Widget build(BuildContext context) {
    const platform = MethodChannel("fang/untils");

    handleButton() async {
      int result;
      try {
        result = await platform.invokeMethod("openAppMarket");
      }catch(e) {
        result = -1;
      }
      print(result);
    }

    _personalDatafunc() {
      showToast("个人资料",position: ToastPosition.bottom);
      handleButton();
    }

    _personalKpiDetailfunc() {
      showToast("我的绩效详情",position: ToastPosition.bottom);
    }
    _dimensionListfunc() {
      showToast("维度列表",position: ToastPosition.bottom);
    }
    _changePasswordfunc() {
      showToast("修改密码",position: ToastPosition.bottom);
    }
    _logOutfunc() {
      showToast("退出登录",position: ToastPosition.bottom);
    }

    List listConfig = [{"title":"个人资料","func":_personalDatafunc},
                       {"title":"我的绩效详情","func":_personalKpiDetailfunc},
                       {"title":"维度列表","func":_dimensionListfunc},
                       {"title":"修改密码","func":_changePasswordfunc},
                       {"title":"退出登录","func":_logOutfunc}];
    return Scaffold(
      appBar: AppBar(title: Text("我的"),),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            color: Colors.grey,
            child: Column(
              children: <Widget>[
                Center(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CustomTextRichWidget(personPerformance: PersonPerformance(title:"绩效总分:", score:"0分", titleFontSize:30, contentFontSize:32),),
                    CustomTextRichWidget(personPerformance: PersonPerformance(title:"绩效减分", score:"0分",titleFontSize:20,contentFontSize:22),),
                    CustomTextRichWidget(personPerformance: PersonPerformance(title:"绩效加分:",score:"0分",titleFontSize:20,contentFontSize:22),),
                    CustomTextRichWidget(personPerformance: PersonPerformance(title:"小组基础分", score:"0分",titleFontSize:20,contentFontSize:22),),
                 ],
                ),
               ),
               
              ],
            )
          ),
          Expanded(
                 child: ListView.builder(
                   itemExtent: 50,
                   scrollDirection: Axis.vertical,
                   itemCount: listConfig.length,
                   itemBuilder: (BuildContext context,int index) {
                     Map map = listConfig[index];
                     return buildItem(context, index,map["title"],map["func"]);
                   },
                ),
              )
        ],
      ),
    );
  }

  
   Widget buildItem(BuildContext context, int index,String title,Function func) {
    //设置分割线
    //设置字体样式
    // Widget divider1=Divider(color: Colors.black);
    TextStyle textStyle =  TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0);
    return GestureDetector(
      onTap: () => func(),
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.fromLTRB(15, 15, 0, 15),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(title, style: textStyle),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: Icon(Icons.navigate_next),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class CustomTextRichWidget extends StatefulWidget {
  PersonPerformance  personPerformance;
  CustomTextRichWidget({
    Key key,
    this.personPerformance
  }):super(key:key);
 
  @override
  State<StatefulWidget> createState() => _CustomTextRichState();
}

class _CustomTextRichState extends State<CustomTextRichWidget> {
  @override
  void initState() {
    // TODO: implement initState
    
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: widget.personPerformance.title,style: TextStyle(fontSize: widget.personPerformance.titleFontSize,color: Colors.black)),
                      TextSpan(text: widget.personPerformance.score,style: TextStyle(fontSize: widget.personPerformance.contentFontSize,color: Colors.red))
                   ]
                  )
             );
  }
}

class PersonPerformance {
  //绩效标题
  String title;
  //绩效分数
  String score;
  double titleFontSize;
  double contentFontSize;
  PersonPerformance({this.title,this.score,this.titleFontSize,this.contentFontSize});
}