//import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flustars/flustars.dart';

class HomePage extends StatefulWidget {
  //用于传递参数
  final Map<String,dynamic> loginIfo;
  HomePage({Key key,this.loginIfo}):super(key:key);


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return new Page();
  }
}

class Page extends State<HomePage> with AutomaticKeepAliveClientMixin{

  List purchaseOrderMenuRight,purchasePriceRight =[];
  bool browseRight=false;//默认为没有
  List menuList =new List(); //采购，销售，库存 管理模块的集合
  List childmenuList =[];
  Color selectColor =null; //选中的颜色
  int CurrIndex =0; //记录当前选中

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // TODO: implement initStat
    super.initState();
    print('判断是否重载了');
    if (childmenuList.length>0){
      childmenuList.clear();
    }
    purchaseOrderMenuRight=widget.loginIfo['purchaseOrderMenuRight'];
    purchasePriceRight    =widget.loginIfo['purchaseOrderMenuRight'];
    selectColor =Colors.black12;
    if(purchaseOrderMenuRight.length>0){
      browseRight =purchaseOrderMenuRight[0]['BrowseRight'];
      childmenuList.add({'moduleName':'采购管理','childModuleName':'订单','color':Colors.orange,'icon':0xe62d,'fromIndex':0,'selectColor':Colors.black12});
    }
    if(purchasePriceRight.length>0){
      childmenuList.add({'moduleName':'采购管理','childModuleName':'收货单','color':Colors.orange,'icon':0xe629,'fromIndex':1,'selectColor':null});
    }
    childmenuList.add({'moduleName':'采购管理','childModuleName':'退货单','color':Colors.orange,'icon':0xe628,'fromIndex':2,'selectColor':null});
    childmenuList.add({'moduleName':'采购管理','childModuleName':'付款单','color':Colors.blueAccent,'icon':0xe636,'fromIndex':3,'selectColor':null});
    childmenuList.add({'moduleName':'采购管理','childModuleName':'费用单','color':Colors.blueAccent,'icon':0xe636,'fromIndex':4,'selectColor':null});

    //添加模块的集合
    menuList.add({'childmenuList':childmenuList,'moduleName':'采购管理'});



  }

  @override
  Widget build(BuildContext context) {
    return layout(context);
  }

  Widget layout(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black12,//Scaffold 改变背景色
      appBar: PreferredSize(
          child: AppBar(
              title: Text('首页'),
              centerTitle: true,
              backgroundColor:hexToColor('#108ee9'),
              automaticallyImplyLeading: false),
          preferredSize: Size.fromHeight(40.0)),
      // appBar: buildAppBar(context),
      body: new ListView(
        children: menuList.asMap().keys.map((j){
                print('模块名字：'+menuList[j]['moduleName']);
            return cardContent(context,(menuList[j]['childmenuList']) as List,menuList[j]['moduleName']);

        }).toList(),
      ),
    );
  }

  Widget buildAppBar(BuildContext context) {
    return new AppBar(title: const Text('首页'));
  }

  Widget header(BuildContext context) {
    return new Image.network(
      'http://i2.yeyou.itc.cn/2014/huoying/hd_20140925/hyimage06.jpg',
    );
  }
  BoxDecoration  selectBox(int index){
    return CurrIndex==index
          ? BoxDecoration(
              color: selectColor,
            )
           :BoxDecoration();
  }

  //ListView 的每项显示部分String moduleName,List childmenuList,Color color,int icon
  Widget cardContent(BuildContext context,List childList,String moduleName){

    return Container(
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 2.0,color: Colors.white),
        borderRadius:BorderRadius.circular(15.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(child: Text(moduleName,style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w700),),
            height: 40.0,
            //margin: EdgeInsets.only(left: 10.0,right: 10.0,top: 10.0),
            padding: EdgeInsets.all(10.0),
            alignment:Alignment(-1,0),
            decoration: new BoxDecoration(
              //color: Colors.redAccent,
            ),
          ),
          Wrap(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            //mainAxisSize: MainAxisSize.max,
            alignment:WrapAlignment.start,
            children: childList.asMap().keys.map((i){
               return  InkWell(
                  onTap: (){
                    setState(() {
                      CurrIndex =i;
                    });

                    print('CurrIndex:${CurrIndex}');
                  },
                  child: Container(
                    height: 80.0,
                    width: ScreenUtil.getInstance().screenWidth/4-10,
                    alignment: Alignment.center,
                    // margin: EdgeInsets.only(left: 10.0,),
                    decoration:selectBox(i),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                            iconSize: 40.0, //0xe62d  Colors.orange
                            icon: Icon( IconData((childList[i]['icon']) as int, fontFamily: 'iconfont'),color: (childList[i]['color']) as Color,size: 40)
                        ),
                        //'订单'
                        Text(childList[i]['childModuleName'],style: TextStyle(fontSize: 13.0),textAlign:TextAlign.center,),
                      ],
                    ),
                  ),
               );
            }).toList(),

              //采购收货单 显示
            /*  Container(
                height: 80.0,
                width: ScreenUtil.getInstance().screenWidth/4-10,
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 5.0,),
                decoration: BoxDecoration(
                  //color: Colors.black12,
                  //border: Border.all(width: 2.0, color: Colors.red),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        iconSize: 40.0,
                        icon: Icon( IconData(0xe629, fontFamily: 'iconfont'),color: Colors.orange,size: 40)
                    ),
                    Text('收货单',style: TextStyle(fontSize: 13.0),textAlign:TextAlign.center,),
                  ],
                ),
              ),
              Container(
                height: 80.0,
                width: ScreenUtil.getInstance().screenWidth/4-10,
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 5.0,),
                decoration: BoxDecoration(
                  //color: Colors.black12,
                  //border: Border.all(width: 2.0, color: Colors.red),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        iconSize: 40.0,
                        icon: Icon( IconData(0xe628, fontFamily: 'iconfont'),color: Colors.orange,size: 40)
                    ),
                    Text('退货单',style: TextStyle(fontSize: 13.0),textAlign:TextAlign.center,),
                  ],
                ),
              ),
              Container(
                height: 80.0,
                width: ScreenUtil.getInstance().screenWidth/4-10,
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 5.0,),
                decoration: BoxDecoration(
                  //color: Colors.black12,
                  //border: Border.all(width: 2.0, color: Colors.red),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        iconSize: 40.0,
                        icon: Icon( IconData(0xe636, fontFamily: 'iconfont'),color: Colors.blueAccent,size: 40)
                    ),
                    Text('付款单',style: TextStyle(fontSize: 13.0),textAlign:TextAlign.center,),
                  ],
                ),
              ),
              Container(
                height: 80.0,
                width: ScreenUtil.getInstance().screenWidth/4-10,
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 5.0,),
                decoration: BoxDecoration(
                  //color: Colors.black12,
                  //border: Border.all(width: 2.0, color: Colors.red),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        iconSize: 40.0,
                        icon: Icon( IconData(0xe636, fontFamily: 'iconfont'),color: Colors.blueAccent,size: 40)
                    ),
                    Text('费用单',style: TextStyle(fontSize: 13.0),textAlign:TextAlign.center,),
                  ],
                ),
              ), */
           // ],
          ),
        ],
      ),
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
      textColor: Colors.white);
}

//十六进制颜色值格式一般如：#ff0000，以#开头，后面跟着6个十六进制字符。
//而flutter中不能直接使用此类形式的颜色值，所以必须要转换为flutter颜色对象。
Color hexToColor(String s) {
  // 如果传入的十六进制颜色值不符合要求，返回默认值
  if (s == null ||
      s.length != 7 ||
      int.tryParse(s.substring(1, 7), radix: 16) == null) {
    s = '#999999';
  }

  return new Color(int.parse(s.substring(1, 7), radix: 16) + 0xFF000000);
}
