
import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:async';
//调用使用 showDialog 加这个组件
class MyDialog extends Dialog{
String title;
String content;

MyDialog({Key key,this.title,this.content}):super(key: key);

//定时器，多少秒后关闭
  _showTimer(context){
    var timer;   //表示3秒  3000毫秒
    timer =Timer.periodic(Duration(milliseconds: 3000), (t){
     Navigator.pop(context);
      t.cancel(); //timer 用这个取消也行
    });
  }


  @override
  Widget build(BuildContext context) {
 //调用定时 关闭
  //  _showTimer(context);

    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          width: 300.0,
          height: 300.0,
          color: Colors.white,
          child: Column(
             children: <Widget>[
               Padding(
                 padding: EdgeInsets.all(10.0),
                 child: Stack(
                   children: <Widget>[
                     Align(
                       alignment:  Alignment.center,
                       child: Text('${this.title}'),
                     ),
                     Align(
                       alignment: Alignment.centerRight,
                       child:
                       InkWell(
                         onTap: (){
                           Navigator.pop(context);
                         },
                         child:Icon(Icons.close),
                       ),
                     ),
                   ],
                 ),
               ),
               Divider(), //分隔线
               Container(
                 padding: EdgeInsets.all(10.0),
                 width: double.infinity,
                 child: Text('${this.content}',textAlign: TextAlign.left,),
               ),

             ],
          )
        ),
      ),
    );
  }
}