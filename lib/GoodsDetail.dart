import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class Goods{
  final String GoodsID="";
  final String Code="";
  final String Name="";
  final double RetailSales=0.0;
}

class GoodsDetail extends  StatefulWidget{
  final Goods goods;
  GoodsDetail({Key key ,this.goods}):super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return new GoodsDetailState();
  }
}
class GoodsDetailState extends State<GoodsDetail>{
  @override
  Widget build(BuildContext context) {
    return layout(context);
  }

  Widget layout(BuildContext context){

    var list= <Widget>[
      Container(
        height: 130, //dp 单位
        alignment: Alignment(0,0),
        decoration: BoxDecoration(
          color: Colors.amber
        ),
        child: Row(
                 children: <Widget>[
                   Container(
                    // padding:EdgeInsets.only(top:2),
                     height: 120,
                     width: 100,
                     child: DecoratedBox(
                           decoration:BoxDecoration(
                             shape: BoxShape.rectangle,
                             borderRadius: BorderRadius.circular(10.0),
                             color: Colors.red,
                             border: new Border.all(width: 1.0, color: Colors.white,),
                             image:  DecorationImage(
                                 image:  AssetImage('img/nopic.jpg'),
                                centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0), //这个属性是填满事个div  Container 没有这个就是剧中显示
                               //  fit: BoxFit.cover
                             ),

                           ),
                     ),
                     margin: EdgeInsets.all(0.0),
                   ),
                 ],
               ),
      ),
    ];


    return new Scaffold( //automaticallyImplyLeading 显示返回按扭
      appBar: PreferredSize(child:AppBar(title:Text('货品详情'),centerTitle: true,backgroundColor:hexToColor('#108ee9'),automaticallyImplyLeading:true),preferredSize: Size.fromHeight(40.0)),
      body: Column(
            children: list,//<Widget>[]  抽出来单独写
      ) ,
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