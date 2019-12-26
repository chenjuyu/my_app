/*
* 列表页向左滑菜单，删除置顶
* */
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/page/arc_progress_bar_page.dart';
import 'package:my_app/page/clear_textfield_page.dart';
import 'package:my_app/page/popup_page.dart';
import 'package:my_app/page/slide_button_page.dart';
import 'package:my_app/page/slide_indicator_page.dart';


class LeftSlide extends StatefulWidget {
  @override
  _LeftSlideState createState() => _LeftSlideState();
}

class _LeftSlideState extends State<LeftSlide> {


  @override
  void initState() {
    super.initState();
    //在 initState 方法中获取 BuildContext
    Future.delayed(Duration(seconds: 0),(){
      print(MediaQuery.of(context).size);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter UI"),
        ),
        body: ListView(
          children: <Widget>[
            getItem(context, "侧滑删除", SlideButtonPage()),
            getItem(context, "进度条", ArcProgressBarPage()),
            getItem(context, "PageView指示器", SlideIndicatorPage()),
            getItem(context, "ClearTextField", ClearTextFieldPage()),
            getItem(context, "PopupPage", PopupPage()),
          ],
        ));
  }

  ListTile getItem(BuildContext context, String title, Widget widget) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.push(
            context, CupertinoPageRoute(builder: (context) => widget));
      },
    );
  }


}


