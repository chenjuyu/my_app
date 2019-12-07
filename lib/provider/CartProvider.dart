
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider with ChangeNotifier{

   List  cartInfo=[];

   String cartString;
   int totalQuantity;
  //goodsItem  一个货品多个颜色尺码的保存  详情页半圆
  addCartInfo(List goodsItem) async{
    SharedPreferences prefs =await SharedPreferences.getInstance();
    if(goodsItem !=null){

      if(cartInfo.length>0){
        cartInfo.forEach((v){
          goodsItem.forEach((g){
            if(v['GoodsID']==g['GoodsID'] && v['ColorID']==g['ColorID'] && v['SizeID']==g['SizeID']){
              v['Quantity']=g['Quantity'];  //覆盖旧的值
            }else { //不存在
              cartInfo.add(g);
            }
          });

        });
      }else{
        cartInfo.addAll(goodsItem);
      }

      cartString =jsonEncode(cartInfo).toString();
      prefs.setString('cartInfo', cartString);
      await getCartInfo();
    }


  }
  //删除 购物车页 单个的
 delCartInfo(int index) async{
   SharedPreferences prefs =await SharedPreferences.getInstance();
   cartString =prefs.getString('cartInfo');
   if(cartString !=null){
     cartInfo= (jsonDecode(cartString) as List).cast();
   }
    if(cartInfo !=null){
      cartInfo.remove(index);
    }

   await getCartInfo();
 }

 removecartInfo() async{
   SharedPreferences prefs =await SharedPreferences.getInstance();
   prefs.remove('cartInfo');
   await getCartInfo();
 }

//修改 购物车页 单个的
  addReduce(int index,String todo) async{
    SharedPreferences prefs =await SharedPreferences.getInstance();
    cartString =prefs.getString('cartInfo');
    if(cartString !=null){
      cartInfo= (jsonDecode(cartString) as List).cast();
      if(todo=='add'){
        cartInfo[index]['Quantity']=cartInfo[index]['Quantity']+1;
      }else if(todo=='jian'){
        cartInfo[index]['Quantity']=cartInfo[index]['Quantity']-1;
      }
      await  getCartInfo();
    }


  }

//购物车页
 getCartInfo() async{
  SharedPreferences prefs =await SharedPreferences.getInstance();
  cartString =prefs.getString('cartInfo');
  if(cartString !=null){
    cartInfo= (jsonDecode(cartString.toString()) as List).cast();
  //  print('得到cartInfo列表：${cartInfo}');
  }

  notifyListeners();
 }

 //根据货品得到总数 单个货号
 getGoodsTotal() async{
  int Quantity =0;
   SharedPreferences prefs =await SharedPreferences.getInstance();
   cartString =prefs.getString('cartInfo');
   if(cartString !=null){
     cartInfo= (jsonDecode(cartString.toString()) as List).cast();
    // print('得到cartInfo列表：${cartInfo}');
  //   var datas =cartInfo.where((item)=>item['GoodsID']==GoodsID);
   //  List goods  =datas.toList();
     cartInfo.forEach((v){
       Quantity =Quantity+v['Quantity'];
     });
   }

  totalQuantity =Quantity;

   print('totalQuantity:${totalQuantity}');
   notifyListeners();
 }






}