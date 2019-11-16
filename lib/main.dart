// Flutter code sample for

// This example shows a [Form] with one [TextFormField] and a [RaisedButton]. A
// [GlobalKey] is used here to identify the [Form] and validate input.

import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_app/MainPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:my_app/utils/global.dart';
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
        //  resizeToAvoidBottomInset:false
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

    return SingleChildScrollView(
      child:    Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        // textDirection:,
        textBaseline: TextBaseline.alphabetic,
        children: <Widget>[// children有这种参数的就是多组件窗器 child是单组件
          Container(//左上右下
            width:double.infinity,
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
                  onSubmitted: (value){
                    checkLogin(context,username.text,password.text);
                  },
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
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 10.0),
                  decoration: BoxDecoration(
                      color: hexToColor('#108ee9'),
                      border: Border.all(width: 1.0,color: hexToColor('#108ee9')),
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  child:Center(child: Text('登录',style: TextStyle(color:Colors.white,fontSize: 18.0),)),
                ),

                onTap:(){
                  checkLogin(context,username.text,password.text);

                }
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SetIP()));
            },
            child: Container(
              alignment: Alignment.bottomRight,
              margin: EdgeInsets.only(top: 30.0),
              child: Text('设置地址',textDirection: TextDirection.rtl,),
            ),
          ),


          /*   Expanded(
          child:
          ListView(
            children: list,
          ),

        ) */

        ],

      ),
    );


  }

  void saveuser(String key,String val) async{
    SharedPreferences pref =await SharedPreferences.getInstance();
    pref.setString(key, val);
  }
  Future  getuser(String key) async {
    SharedPreferences pref =await SharedPreferences.getInstance();
    return pref.getString(key);
  }

  void checkLogin(BuildContext context,String username,String password){
    Map<String,Object> aMap={};
    if(username ==null || password==null || password =='' || username==''){
      print('用户名或者密码为空不能提交');
      toast('用户名或者密码为空不能提交');
      return ;
    }else{
      print('提交的内容为：${username} ,${password}');
      login(username,password).then((val){
        // print('val的值:${val}');
        print('val的值:${val}');
        var data= jsonDecode(val.toString());
        print('obj的值:'+data['obj'].toString());
        if(data['success']){
          saveuser('obj',data['obj'].toString());
          saveuser('token',data['obj']['token']);

          getuser('token').then((token){
            print('token的值:${token}');
          });


          aMap['UserID']= data['obj']['UserID'];
          aMap["UserName"] =data['obj']['UserName'];
          print('aMap的值:${aMap.toString()}');
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>MainPage(aMap:aMap),
            ),
          );
        }else{

          G.toast(data['msg']);
        }
      });
    }

  }

  Future login(String username,String password) async{
    Options options =Options(headers: {'ContentType':'application/json'});
    SharedPreferences pref =await SharedPreferences.getInstance();
     Response res= await Dio().post(
          pref.getString('ip')+'/login.do?login',
          queryParameters: {'username':username,'password':password},
          options:options,
      );

     return res;
  }

  void _search(String value){

    print('方法外的执行的：${value}');

  }

}



  class SetIP extends StatefulWidget {
    @override
    _SetIPState createState() => _SetIPState();
  }

  class _SetIPState extends State<SetIP> {
    @override
    Widget build(BuildContext context) {

      TextEditingController controller=new TextEditingController();


      getip('ip').then((val){
      if(val !='' && val !=null) {

      controller.text = val;
      }
      });


      return Container(
        child: Scaffold(
            appBar: PreferredSize(
            child:AppBar(title: Text('设置服务器地址'),),
            preferredSize: Size.fromHeight(40.0)
            ),
            body: Container(
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: controller,
                    onSubmitted: (value){
                      saveip(context,value);
                    },
                    decoration: const InputDecoration(
                      hintText: '请输入地址'
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      if(controller.text=='' || controller.text==null){
                        toast('设置地址不能为空');
                      }else{
                        saveip(context,controller.text);

                      }

                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 40.0,
                      width: double.infinity,
                      margin: EdgeInsets.only(top:20.0),
                      decoration: BoxDecoration(
                          color: hexToColor('#108ee9'),
                          border: Border.all(
                            width: 1.0,
                            color: hexToColor('#108ee9')
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(5.0))
                      ),
                      child: Text('保存',style: TextStyle(color: Colors.white,fontSize: 20.0),),
                    ),
                  ),

                ],
              ),
            ),
          ),
      );
    }
}
void saveip(BuildContext context,String ip)async{
  if(ip !='' && ip !=null) {
  SharedPreferences pref= await SharedPreferences.getInstance();
  pref.setString('ip', ip);
  Navigator.pop(context);
  }else{
   toast('地址不能为空');
  }
}

Future getip(String ip) async{

    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString('ip');

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
}//十六进制颜色值格式一般如：#ff0000，以#开头，后面跟着6个十六进制字符。
//而flutter中不能直接使用此类形式的颜色值，所以必须要转换为flutter颜色对象。
  Color hexToColor(String s) {
    // 如果传入的十六进制颜色值不符合要求，返回默认值
    if (s == null || s.length != 7 || int.tryParse(s.substring(1, 7), radix: 16) == null) {
      s = '#999999';
    }

    return new Color(int.parse(s.substring(1, 7), radix: 16) + 0xFF000000);
  }

