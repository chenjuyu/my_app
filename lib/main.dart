// Flutter code sample for

// This example shows a [Form] with one [TextFormField] and a [RaisedButton]. A
// [GlobalKey] is used here to identify the [Form] and validate input.

import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_app/MainPage.dart';
void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = '登录';



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false, //去掉右上角的debug图标
      theme: ThemeData(
        primaryColor: hexToColor('#108ee9'),
      ),
      home: Scaffold(
        appBar: PreferredSize(
            child:
            AppBar(
                 title: const Text(_title,textAlign: TextAlign.center,style: TextStyle(fontSize: 18.0),),
                 centerTitle: true,
                 backgroundColor:hexToColor('#108ee9'),
                actions: <Widget>[
                  new IconButton(
                      icon: new Icon(Icons.menu),
                      tooltip: '搜索',
                      onPressed: (){
                     //   NavigatorUtil.intentToPage(context, new SearchPage(), pageName: "SearchPage");
                      }
                  )
                ],
                  ),
            preferredSize: Size.fromHeight(40.0)), //screenSize.height * 0.07
            body: MyStatefulWidget(),
          resizeToAvoidBottomInset:true
     //   resizeToAvoidBottomPadding: false, //输入框抵住键盘
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);



  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  _MyStatefulWidgetState({Key key});






  @override
  void initState() {


    super.initState();

  }



  @override
  Widget build(BuildContext context) {

      TextEditingController username =new TextEditingController();
      TextEditingController password =new TextEditingController();
    List<Widget> list = <Widget>[

      new ListTile(
        title: new Text('Mi is One',
          style: new TextStyle(fontWeight: FontWeight.w500,fontSize: 20),
        ),
        subtitle: new Text("85 W zq"),
        leading: new Icon(Icons.theaters,color: Colors.blue[500]),
      ),
      new ListTile(
          title: new Text("Test at Tow",style: new TextStyle(fontWeight: FontWeight.w500,fontSize: 20)),
          subtitle: new Text("666 Car"),
          leading: new Icon(Icons.list,color: Colors.blue[500])
      ),
      new ListTile(
        title: new Text('Three',
          style: new TextStyle(fontWeight: FontWeight.w500,fontSize: 20),
        ),
        subtitle: new Text("85 W zq"),
        leading: new Icon(Icons.theaters,color: Colors.blue[500]),
      ),
      new ListTile(
        title: new Text("Four",style: new TextStyle(fontWeight: FontWeight.w500,fontSize: 20)),
        subtitle: new Text("666 Car"),
        leading: new Icon(Icons.list,color: Colors.blue[500]),
        onTap: (){
          Fluttertoast.showToast(
              msg: " Four",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIos: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white
          );
        },

      )
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      // textDirection:,
      textBaseline: TextBaseline.alphabetic,
      children: <Widget>[// children有这种参数的就是多组件窗器 child是单组件
      Container(//左上右下
        width: 300.0,
        height: 120.0,
       // color: Colors.amber,
        alignment: Alignment(0,0),
        padding: EdgeInsets.only(top:10.0),
       child: Column(
         children:<Widget>
         [TextField(
            controller: username,
            inputFormatters: [LengthLimitingTextInputFormatter(200),], //contentPadding: const EdgeInsets.symmetric(vertical: 4.0),
            decoration:const InputDecoration(hintText: '用户',icon: Icon(Icons.person)),),
        TextField(
          controller: password,
          obscureText:true, //密码类型的
          decoration:const InputDecoration(hintText: '密码',icon: Icon(Icons.lock)),),
       ],
       ),
    ),
      Center(
        child:  GestureDetector(
            behavior: HitTestBehavior.opaque,
            child:
            Container(
              //设置 child 居中
              alignment: Alignment(0, 0),
              //  color: Colors.lightBlue,
              height: 35,
              width: 300.0,//double.infinity,
              margin: EdgeInsets.only(top: 10.0),
              decoration: BoxDecoration(
                  color: hexToColor('#108ee9'),
                  border: Border.all(width: 1.0,color: hexToColor('#108ee9')),
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
              child:Center(child: Text('登录',style: TextStyle(color:Colors.white,fontSize: 18.0),)),
            ),

            onTap:(){
              if(username.text ==null || password.text==null || password.text =='' || username.text==''){
                print('用户名或者密码为空不能提交');
                toast('用户名或者密码为空不能提交');
                return ;
              }else{
                print('提交的内容为：${username.text} ,${password.text}');

                var menu={'a':1,'b':2,'c':3,'d':[{'username':'系统管理员'},{'username2':'系统管理员2'},{'username3':'系统管理员3'}]} ;

                final  Map<String,Object> aMap={'username':username.text,'password':password.text,'menu':menu};


                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>MainPage(aMap:aMap),
                  ),
                );
              }

            }
        ),
      )

    /*   Expanded(
          child:
          ListView(
            children: list,
          ),

        ) */

      ],

    );







  }

  void _search(String value){

    print('方法外的执行的：${value}');

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

