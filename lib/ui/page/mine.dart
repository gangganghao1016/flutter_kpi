
import 'package:flutter/material.dart';
import 'package:flutter_kpi/utils/util_index.dart';
import 'package:flutter_kpi/common/component_index.dart';

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
    
    return Scaffold(
      appBar: AppBar(title: Text("我的"),),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(50),
            color: Colors.grey,
            child: Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: "绩效总分:",style: TextStyle(fontSize: 30,color: Colors.black)),
                      TextSpan(text: "0分",style: TextStyle(fontSize: 32,color: Colors.red))
                   ]
                  )
               ),
               Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: "绩效减分:",style: TextStyle(fontSize: 20,color: Colors.black)),
                      TextSpan(text: "10分",style: TextStyle(fontSize: 22,color: Colors.red))
                   ]
                  )
               ),
               Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: "绩效加分:",style: TextStyle(fontSize: 20,color: Colors.black)),
                      TextSpan(text: "0分",style: TextStyle(fontSize: 22,color: Colors.red))
                   ]
                  )
               ),
               Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: "小组基础分:",style: TextStyle(fontSize: 20,color: Colors.black)),
                      TextSpan(text: "0分",style: TextStyle(fontSize: 22,color: Colors.red))
                   ]
                  )
               ),
              ],
            ),
            )
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

}