import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';
import 'package:my_app/HomePage.dart';
import 'package:my_app/SalesMenu.dart';
import 'package:my_app/PurchaseMenu.dart';
import 'package:my_app/SettingMenu.dart';
import 'package:flustars/flustars.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainPage extends StatefulWidget {
  final Map<String,Object> aMap ;
  MainPage({Key key,this.aMap}):super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {

  int _currentIndex = 0;
  final List<Widget> _children = [
    SalesMenu(),
    PurchaseMenu(),
    HomePage(),
    SettingMenu(),
   // new PlaceholderWidget('Home'),
   // new PlaceholderWidget('Profile'),
  ];



  DateTime lastPopTime;
  String token;
  @override
  void initState() {

    getip();
//   print('main页initState中获取到token的:${map['token']}');
    print('初始化了');
    super.initState();
  }

  void getip() async{
    SharedPreferences pref= await SharedPreferences.getInstance();
    print('main页initState中获取到的:${pref.getString('ip')}');
  }


  @override
  Widget build(BuildContext context) {
    print('接收的数据： ${widget.aMap.toString()}');// 通过widget获取父组件的数据





    return WillPopScope(
    child:
        Scaffold(
     // appBar: PreferredSize(child:AppBar(title:Text('主页'),centerTitle: true,backgroundColor:hexToColor('#108ee9'),automaticallyImplyLeading:false),preferredSize: Size.fromHeight(40.0)),
      body: IndexedStack(
        index: _currentIndex,
        children: _children,
      ),//_children[_currentIndex],
      bottomNavigationBar: new BottomNavigationBar(
        //flutter 设置BottomNavigationBar超过3个后，不显示颜色 解决
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          new BottomNavigationBarItem(
            icon: new Icon(Icons.store_mall_directory),
            title: new Text('销售'),
          ),
        new  BottomNavigationBarItem(
            icon: new Icon(Icons.add_shopping_cart),
            title: new Text('采购'),
          ),
          new  BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('首页'),
          ),
         new BottomNavigationBarItem(
            icon: new Icon(Icons.settings),//Icons.person
            title: new Text('设置'),
          ),
        ],
      ),
    ),
        onWillPop: () async {
          // 点击返回键的操作
          if (lastPopTime == null ||
              DateTime.now().difference(lastPopTime) > Duration(seconds: 2)) {
            lastPopTime = DateTime.now();
            toast('再按一次退出');
          } else {
            lastPopTime = DateTime.now();
            // 退出app
            await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
          }
        }
          );

  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

class PlaceholderWidget extends StatelessWidget {
  final String text;

  PlaceholderWidget(this.text);

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text(text),
    );
  }
}

void toast(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIos: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white
  );
}
//十六进制颜色值格式一般如：#ff0000，以#开头，后面跟着6个十六进制字符。
//而flutter中不能直接使用此类形式的颜色值，所以必须要转换为flutter颜色对象。
Color hexToColor(String s) {
  // 如果传入的十六进制颜色值不符合要求，返回默认值
  if (s == null || s.length != 7 || int.tryParse(s.substring(1, 7), radix: 16) == null) {
    s = '#999999';
  }

  return new Color(int.parse(s.substring(1, 7), radix: 16) + 0xFF000000);
}