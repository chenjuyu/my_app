

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../model/GoodsSubType.dart';

class SubTypeProvider with ChangeNotifier{

   //变量
  List<GoodsSubType>  datalist=[];
  int childIndex=0; //子类切换的值默认为0
  getSubTypeList(List<GoodsSubType> ls){
    if(datalist.length>0)
      datalist.clear();
    childIndex =0; //大类每次点都要归0
    GoodsSubType all=new GoodsSubType();
    all.GoodsTypeID='';
    all.GoodsSubTypeID='';
    all.Name ='全部';
    datalist.add(all);
    datalist.addAll(ls);
    notifyListeners();
  }

  changeChildIndex(int index){
    childIndex =index;
    notifyListeners();
  }


}
