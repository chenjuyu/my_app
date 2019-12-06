
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider with ChangeNotifier{

   List  cartInfo=[];

  String cartString;
  //goodsItem  一个货品多个颜色尺码的保存  详情页半圆
  addCartInfo(List goodsItem) async{
    SharedPreferences prefs =await SharedPreferences.getInstance();
    if(goodsItem !=null){
      cartInfo.addAll(goodsItem);
      cartString =jsonEncode(cartInfo).toString();
      prefs.setString('cartInfo', cartString);
      await getCartInfo();
    }


  }
  //删除 购物车页
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
//修改 购物车页
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
    print('得到cartInfo列表：${cartInfo}');
  }

  notifyListeners();
 }






}