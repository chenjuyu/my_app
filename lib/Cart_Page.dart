import 'package:flutter/services.dart';
import 'dart:async';
import 'package:color_dart/color_dart.dart';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './provider/CartProvider.dart';
import 'package:flustars/flustars.dart';
import './component/CustomerCheckbox.dart';

class CartPage extends StatefulWidget {

   @override
   _CartDataState createState() => _CartDataState();
 }


 class _CartDataState extends  State<CartPage> {

final AsyncMemoizer _memoizer = AsyncMemoizer();

 bool isCheckAll=true;

   @override
   Widget build(BuildContext context) {
     return   Scaffold(
       appBar: PreferredSize(
         child: AppBar(
           title: Text('购物车'),

         ),
         preferredSize: Size.fromHeight(40.0),
       ),
       body:   FutureBuilder(
         future: _getData(context),
         builder: (context, snapshot){
           //  List cartInfo=Provider.of<CartProvider>(context).cartInfo;
           if(snapshot.hasData ) {
             return Stack(
               children: <Widget>[
                 Consumer<CartProvider>(
                     builder: (context,cartProvider,_)  {
                       print('重会了ggggg');
                       // Provider.of<CartProvider>(context).getCartInfo();
                       return ListView.builder(
                         itemCount: cartProvider.cartInfo.length,
                         itemBuilder: (context,index){

                           return Container(
                             height: 150.0,
                             child: Column(
                                 children: <Widget>[

                                   Row(
                                       crossAxisAlignment: CrossAxisAlignment.center,
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       children: <Widget>[
                                         CustomerCheckbox(
                                           value: true,
                                           isCircle: true,
                                           activeColor: Colors.redAccent,
                                           onChanged: (v){

                                           },
                                         ),
                                         Container(
                                           height:80.0,
                                           width: 40.0,
                                           child:  Image.asset('images/1.JPG'),
                                         ),
                                         Container(
                                           margin: EdgeInsets.only(left: 5.0),
                                           height: 40.0,
                                           child: Column(
                                             children: <Widget>[
                                               Container(
                                                 height:20.0,
                                                 child: Text(cartProvider.cartInfo[index]['Name']),
                                               ),
                                             ],
                                           ),
                                         ),
                                       ]
                                   ),
                                   //尺码颜色 一行
                                   Row(
                                     crossAxisAlignment: CrossAxisAlignment.center,
                                     children: <Widget>[
                                       CustomerCheckbox(
                                         isCircle: true,
                                         value: true,
                                         activeColor: Colors.redAccent,
                                         onChanged: (v){

                                         },

                                       ),
                                       Container( // 颜色尺码在一行，颜色为灰色
                                         padding: EdgeInsets.only(left: 5.0,right: 5),
                                         height: 45.0,
                                         decoration: BoxDecoration(
                                           color: Color.fromRGBO(236, 236, 236, 1.0),
                                         ),
                                         child: Row(
                                           crossAxisAlignment: CrossAxisAlignment.center,
                                           children: <Widget>[
                                             Container(
                                               height: 20.0,
                                               child:  Text('颜色:${cartProvider.cartInfo[index]['Color']}',style: TextStyle(fontSize: 12.0,color: hex('#696969')),),
                                             ),

                                             Container(
                                               margin: EdgeInsets.only(left: 20.0),
                                               height: 20.0,
                                               child:  Text('尺码:${cartProvider.cartInfo[index]['Size']}',style: TextStyle(fontSize: 12.0,color: hex('#696969'))),
                                             ),
                                             //尺码 添加减少
                                             Container(
                                               margin: EdgeInsets.only(left: 40.0),
                                               height: 35.0,
                                               child: Row(
                                                 crossAxisAlignment: CrossAxisAlignment.center,
                                                 children: <Widget>[
                                                   InkWell(
                                                     onTap: (){},
                                                     child: Container(
                                                       margin:EdgeInsets.only(left: 10.0),
                                                       alignment:Alignment.center,
                                                       height: 25.0,
                                                       width: 25.0,
                                                       decoration:BoxDecoration(
                                                         border: Border.all(
                                                             width: 1.0,
                                                             color: Colors.black12
                                                         ),
                                                         color:Color.fromRGBO(236,236,236,1.0),
                                                       ),
                                                       child: Text('—',style: TextStyle(color: Colors.black12),
                                                       ),
                                                     ),
                                                   ),

                                                   Container(
                                                     width: 25.0,
                                                     height: 25.0,
                                                     decoration:
                                                     BoxDecoration(
                                                       border: Border.all(
                                                           width: 1.0,
                                                           color: Colors.black12),
                                                     ),
                                                     child: ConstrainedBox(
                                                       constraints:
                                                       BoxConstraints(
                                                         maxWidth: 25.0,
                                                         maxHeight: 25.0,
                                                       ),
                                                       child: TextField(
                                                         style: TextStyle(fontSize: 12.0,color: hex('#696969')),
                                                         onChanged: (v) {
                                                           if (int.parse(v) is int && int.parse(v) <=int.parse(cartProvider.cartInfo[index]['stockQty'])) {
                                                             print(v);
                                                             setState(() {
                                                               cartProvider.cartInfo[index]['Quantity'] =int.parse(v);
                                                               int tipqty = 0;

                                                             });
                                                           }
                                                         },
                                                         //  controller: sizeTxt[index],
                                                         keyboardType: TextInputType.number,
                                                         inputFormatters: [WhitelistingTextInputFormatter.digitsOnly,//只输入数字
                                                           LengthLimitingTextInputFormatter(6), //限制长度
                                                         ],
                                                         decoration:
                                                         InputDecoration(
                                                           contentPadding:
                                                           EdgeInsets.symmetric(vertical:4.0),
                                                           border: OutlineInputBorder(
                                                               borderSide: BorderSide.none),
                                                         ),
                                                       ),
                                                     ),
                                                   ),
                                                   InkWell(
                                                     onTap: () {

                                                     },
                                                     child: Container(
                                                       alignment: Alignment.center,
                                                       height: 25.0,
                                                       width: 25.0,
                                                       decoration:
                                                       BoxDecoration(
                                                         border: Border.all(width: 1.0, color: Colors.black12),
                                                         color:Color.fromRGBO(236,236,236,1.0),
                                                       ),
                                                       child: Text('+'),
                                                     ),
                                                   ),

                                                 ],
                                               ),

                                             ),
                                           ],
                                         ),
                                       ),


                                     ],
                                   ),

                                 ]
                             ),

                           );
                         },
                       );
                       // );
                     }
                 ),
                 Container(
                   height: 50.0,
                   decoration: BoxDecoration(
                     color: Colors.white,
                     border: Border(
                         bottom: BorderSide(width: 1.0, color: Colors.black12)),
                   ),
                   child:
                   Row(
                     children: <Widget>[
                       CustomerCheckbox(
                         value: isCheckAll,
                         isCircle:true,
                         width:18.0,
                         activeColor: Colors.redAccent,
                         onChanged: (v){
                           isCheckAll =v;
                         },
                       ),
                       Text('全选')
                     ],
                   ),
                 ),

               ],
             );
           } else{
             return  Text('正在加载');
           }
         },

       ),
      bottomNavigationBar: totalPay(),

     );





   }

   Future<String> _getData(BuildContext context) async{

      _memoizer.runOnce(() async{
       await Provider.of<CartProvider>(context).getCartInfo();
     });
      return 'end';
   }
 }



 //底部独立一个widget

 class totalPay extends StatefulWidget {
   @override
   _totalPayState createState() => _totalPayState();
 }

 class _totalPayState extends State<totalPay> {
   @override
   Widget build(BuildContext context) {
     return Container(
       padding: EdgeInsets.only(left: 2.0),
       decoration: BoxDecoration(
         color: Colors.white,
         border: Border(top: BorderSide(width: 1, color: Colors
             .white)),
       ),
       width: ScreenUtil
           .getInstance()
           .screenWidth - 2,
       //85.0,
       height: 42.0,
       child: Row(
         crossAxisAlignment: CrossAxisAlignment.center,
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: <Widget>[
           Container(
             width: ScreenUtil
                 .getInstance()
                 .screenWidth - 120,
             margin: EdgeInsets.only(right: 5.0),
             //color: Colors.redAccent,
             height: 40.0,
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: <Widget>[
                 Container(
                   width: ScreenUtil
                       .getInstance()
                       .screenWidth - 120,

                   height: 20.0,
                   child: Row(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     mainAxisAlignment: MainAxisAlignment
                         .spaceBetween,
                     children: <Widget>[
                       Text('本单已为你节省',
                         style: TextStyle(fontSize: 12.0),),
                       Text('共2.00件',
                         style: TextStyle(fontSize: 12.0),),
                     ],
                   ),
                 ),
                 Container(
                   width: ScreenUtil
                       .getInstance()
                       .screenWidth - 120,
                   height: 20.0,
                   child: Row(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     mainAxisAlignment: MainAxisAlignment
                         .spaceBetween,
                     children: <Widget>[
                       Text('￥110.00', style: TextStyle(
                           fontSize: 12.0,
                           color: Colors.redAccent),),
                       Container(
                         child: Row(
                           children: <Widget>[
                             Text('合计:', style: TextStyle(
                                 fontSize: 12.0,
                                 color: Colors.black),),
                             Text('￥990.00', style: TextStyle(
                                 fontWeight: FontWeight.bold,
                                 fontSize: 14.0,
                                 color: Colors.redAccent),),
                           ],

                         ),
                       ),

                     ],
                   ),
                 ),
               ],
             ),
           ),
           Container(
             alignment: Alignment.center,
             height: 42.0,
             width: 110.0,
             decoration: BoxDecoration(
               color: Colors.redAccent,

             ),
             child: Text('结算',
               style: TextStyle(color: Colors.white),),
           ),
         ],
       ),
     );
   }
 }

 