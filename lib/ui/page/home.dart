import 'package:flutter/material.dart';
import 'package:flutter_kpi/utils/toast.dart';
import 'package:oktoast/oktoast.dart';

class HomeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<HomeWidget> with SingleTickerProviderStateMixin {

  // @override
  // void initState() {
  //   super.initState();

    
  // }
   _addKpi() {
    showToast("添加绩效",position: ToastPosition.bottom);
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("首页"),),
      body: Column(

      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _addKpi,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}