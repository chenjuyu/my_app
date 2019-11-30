import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_app/GoodsType_Page.dart';
import 'package:my_app/articlelist.dart';
import 'package:my_app/GoodsDetail.dart';
import 'package:my_app/baseRadio.dart';
import 'package:my_app/popup_route_page.dart';
import 'package:my_app/utils/Request.dart';
import 'package:dio/dio.dart';
import './utils/global.dart';
import './model/GoodsTypeModel.dart';
class SalesMenu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return new SalesMenuState();
  }
}

class SalesMenuState extends State<SalesMenu> {
  @override
  Widget build(BuildContext context) {
    return layout(context);
  }

  Widget layout(BuildContext context) {
    return new Scaffold(
      appBar: PreferredSize(child:AppBar(title:Text('销售'),centerTitle: true,backgroundColor:hexToColor('#108ee9'),automaticallyImplyLeading:false),preferredSize: Size.fromHeight(40.0)),
      body: new ListView(
        children: <Widget>[
          header(context),
          GestureDetector(
            child: Center(
                   child:
                   Container(
                     height: 50,
                     width: double.infinity, //屏幕在宽
                     decoration: BoxDecoration(
                       border: new Border.all(width: 2.0, color: Colors.red),
                       color: Colors.lightBlue,

                     /*  image: DecorationImage(
                         image:NetworkImage('http://h.hiphotos.baidu.com/zhidao/wh%3D450%2C600/sign=0d023672312ac65c67506e77cec29e27/9f2f070828381f30dea167bbad014c086e06f06c.jpg'),
                         centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
                       ) */

                     ),
                     margin: EdgeInsets.only(top:20.0),
                     child: Center(child:Text('跳转',textDirection:TextDirection.ltr,)),

                   ),
                   ),
            onTap: (){
             Navigator.push(context,
                 MaterialPageRoute(builder: (context)=>GoodsDetail()), //ArticleListScreen()
             );
            },
          ),
          InkWell(
            onTap: (){
              Navigator.push(context,
                MaterialPageRoute(builder: (context)=>PopupRoutePage()), //baseRadio() ArticleListScreen()
              );
            },
            child: Container(
              alignment: Alignment(0,0),
              height: 50,
              width: double.infinity, //屏幕在宽
              child: Text('跳到滚动页'),
            ),
          ),
          InkWell(
            onTap: ()  {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>GoodsType_Page()));
           /*  G.loading.show(context);
              _getGoodsType('',1).then((res){
                print('测试打印结果:${res}');
                var data =jsonDecode(res.toString());
                GoodsTypeModelList ls =GoodsTypeModelList.fromJson(data);
                List<GoodsTypeModel> obj =ls.obj;
                for(int i=0;i<obj.length;i++){
                  print('类别名称:${obj[i].Name}');
                }

                print('数据:${ls.obj.length}');
              });
            G.loading.hide(context); */
            },
            child:  Container(
              alignment: Alignment.center,
              height: 50,
              width: double.infinity, //屏幕在宽
              decoration: BoxDecoration(
                border: new Border.all(width: 2.0, color: Colors.red),
                color: Colors.lightBlue,

                /*  image: DecorationImage(
                         image:NetworkImage('http://h.hiphotos.baidu.com/zhidao/wh%3D450%2C600/sign=0d023672312ac65c67506e77cec29e27/9f2f070828381f30dea167bbad014c086e06f06c.jpg'),
                         centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
                       ) */

              ),
              margin: EdgeInsets.only(top:20.0),
              child: Text('测试cookie手动保存设置',textDirection:TextDirection.ltr,),

            ),
          ),
        ],
      ),
    );
  }

  Future _getGoodsType(String param,int currPage) async{
    Request request =Request();
    var queryParameters ={'param':param,'currPage':currPage};
        Response res=await  request.post('/select.do?getGoodsType', queryParameters);
    return res;
  }

  Widget buildAppBar(BuildContext context) {
    return new AppBar(title: const Text('销售'));
  }

  Widget header(BuildContext context) {
    return new Image.network(
      'http://i2.yeyou.itc.cn/2014/huoying/hd_20140925/hyimage06.jpg',

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