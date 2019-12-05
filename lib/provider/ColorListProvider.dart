

import 'package:flutter/material.dart';

class ColorListProvider with ChangeNotifier{

    List colorList=[];
    List sizeList=[]; //这个是所有的颜色尺码
    List choseSizeList=[];//这个根据当前选择的颜色ID 过滤显示的
    int selectColorIndex=0;
    SetColorList(List colorlist,int index,List sList){
      colorList =colorlist;
      selectColorIndex =index;
      sizeList =sList;
      var datas  =sizeList.where((item)=>item['ColorID']==colorList[index]['ColorID']);
      choseSizeList =datas.toList();
      print('打印一下比较与所有的sizeList的键位区别：${sizeList}');
      print('打印一下比较与所有的choseSizeList的键位区别：${choseSizeList}');
      notifyListeners();
    }
    //代表哪条数据
    addQty(int index){


    }






}



