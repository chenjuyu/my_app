
import 'dart:async';

import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './provider/CartProvider.dart';
import 'package:flustars/flustars.dart';
 class CartPage extends StatelessWidget {





   @override
   Widget build(BuildContext context) {
    // Provider.of<CartProvider>(context).getCartInfo();
     print('重绘了.主界面.......');
          return Scaffold(
            appBar: PreferredSize(
              child: AppBar(
                title: Text('购物车'),
                
              ),
              preferredSize: Size.fromHeight(40.0),
            ),
            body: Container(
             child: CartData(),
            )


          );
   }



 }


 class CartData extends StatefulWidget {

   @override
   _CartDataState createState() => _CartDataState();
 }


 class _CartDataState extends  State<CartData> {

final AsyncMemoizer _memoizer = AsyncMemoizer();

   @override
   Widget build(BuildContext context) {
     return  FutureBuilder(
       future: _getData(context),
       builder: (context, snapshot){
         //  List cartInfo=Provider.of<CartProvider>(context).cartInfo;
         if(snapshot.hasData ) {
           return Stack(
             children: <Widget>[
               Container(
                 decoration: BoxDecoration(
                   border: Border(
                       bottom: BorderSide(width: 1.0, color: Colors.black12)),
                 ),
                 child:
                 Row(
                   children: <Widget>[
                     Radio(
                       activeColor: Colors.redAccent,
                     ),
                     Text('全选')
                   ],
                 ),
               ),
         Consumer<CartProvider>(
         builder: (context,cartProvider,_)  {
         print('重会了ggggg');
         // Provider.of<CartProvider>(context).getCartInfo();
         return// Expanded(
         //child:
         ListView.builder(
         itemCount: cartProvider.cartInfo.length,
         itemBuilder: (context,index){
         return Container(
         height: 150.0,
         child: Column(
         children: <Widget>[
         Row(
         children: <Widget>[
         Container(
         height:80.0,
         width: 40.0,
         child:  Image.asset('images/1.JPG'),
         ),
         Text(cartProvider.cartInfo[index]['Name']
         ),
         ],
         ),
         // Row(),
         //Row(),
         ],
         ),
         );
         },
         );
         // );
         }),
               Positioned(
                 bottom: 0,
                 right: 0,
                 child: Container(
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
                 ),
               ),
             ],
           );
         } else{
           return  Text('正在加载');
         }
       },

     );



   }

   Future<String> _getData(BuildContext context) async{

      _memoizer.runOnce(() async{
       await Provider.of<CartProvider>(context).getCartInfo();
     });
      return 'end';
   }
 }

 