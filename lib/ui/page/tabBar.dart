  import 'package:flutter/material.dart';

  import 'home.dart';
  import 'mine.dart';

class TabBarPage extends StatefulWidget {
  TabBarPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _TabBarPageState createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    List<Widget> getSubTabViewWidget() {
      return [HomeWidget(),
              MineWidget()];
    }
    List<Widget> getTabIconWdget() {
      return [Tab(icon: Icon(Icons.home),text: "首页",),
              Tab(icon: Icon(Icons.person),text: "我的",)
              ];
    }
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: TabBarView(
          children: getSubTabViewWidget(),
        ),
        bottomNavigationBar: TabBar(
          tabs: getTabIconWdget(),
          unselectedLabelColor: Colors.grey,
          labelColor: Colors.orange,
        ),
      ),
    );

    
  }
}