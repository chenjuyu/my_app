import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flustars/flustars.dart';

class EasyRefreshDemo extends StatefulWidget {
  @override
  _EasyRefreshDemoState createState() => _EasyRefreshDemoState();
}

class _EasyRefreshDemoState extends State<EasyRefreshDemo> {
  EasyRefreshController _controller;

  List dataList = [];
  int listlen;

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < 15; i++) {
      Map map = new Map();
      map['Name'] = '大广西${i}';
      map['Quantity'] = i;
      map['Amount'] = 9000.55;
      dataList.add(map);
    }
    listlen = dataList.length;
    _controller = EasyRefreshController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:PreferredSize(
        child:AppBar(
          centerTitle: true,
          title: Text("上下拉刷新",style: TextStyle(fontSize: 18.0),),
        ),
        preferredSize: Size.fromHeight(40.0),
      ),
      body: Column(
          children: <Widget>[
           TextField(
                decoration: InputDecoration(
                 hintText: '请输入关键字查询'
                  // contentPadding: EdgeInsets.symmetric(vertical: 4.0),
                ),
              ),

           Expanded(
             child:  EasyRefresh(
               controller: _controller,
               header: ClassicalHeader(
                 refreshedText:'',
                 infoText:'',
                 enableHapticFeedback:false,
               ),
               footer: ClassicalFooter(
                 loadingText: '正在加载',
                 loadedText: '加载完成',
                 noMoreText:'',// '我是有底线的',
                   infoText:'',
                   showInfo:false,
                   enableInfiniteLoad:false,
                   enableHapticFeedback:false,
               ),
               onRefresh: () async {
                 await Future.delayed(Duration(seconds: 2), () {
                   print('onRefresh');
                   dataList.clear();
                   setState(() {
                     for (int i = 0; i < 15; i++) {
                       Map map = new Map();
                       map['Name'] = '大广西${i}';
                       map['Quantity'] = i;
                       map['Amount'] = 9000.55;
                       dataList.add(map);
                     }
                     listlen = dataList.length;
                   });
                   _controller.resetLoadState();
                 });
               },
               onLoad: () async {
                 await Future.delayed(Duration(seconds: 2), () {
                   print('onLoad');
                   setState(() {
                     for (int i = listlen; i < listlen + 15; i++) {
                       Map map = new Map();
                       map['Name'] = '大广西${i}';
                       map['Quantity'] = i;
                       map['Amount'] = 9000.55;
                       dataList.add(map);
                     }
                     listlen =dataList.length;
                   });
                   _controller.finishLoad(noMore: dataList.length >= 40);
                 });
               },
                 child: ListView(
                     children: dataList.asMap().keys.map((index) {
                       return Container(
                         width: 60.0,
                         height: 60.0,
                         child: Center(
                           child: Text(dataList[index]['Name']),
                         ),
                         color: index % 2 == 0 ? Colors.grey[300] : Colors.transparent,
                       );
                     }).toList()),



             ),
           ),
          ]
      ),
     bottomNavigationBar: InkWell(
       onTap: (){},
        child: Container(
          width: ScreenUtil.getInstance().screenWidth-10,
          height: 35.0,
          alignment: Alignment.center,
          //margin: EdgeInsets.only(left: 5,right: 5),
          child: Text('确定',style: TextStyle(color: Colors.white,fontSize: 18.0),),
          decoration: BoxDecoration(
            color: Colors.orange,
            border: Border.all(width: 1.0,color: Colors.orange),
            borderRadius:BorderRadius.all(Radius.circular(5.0)),
          ),
        ),
     )
      /*   persistentFooterButtons: <Widget>[
       FlatButton(
              onPressed: () {
                _controller.callRefresh();
              },
              child: Text("Refresh", style: TextStyle(color: Colors.black))),
          FlatButton(
              onPressed: () {
                _controller.callLoad();
              },
              child: Text("Load more", style: TextStyle(color: Colors.black))),

        ]  */
    );
  }
}
