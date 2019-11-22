import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:segment_control/segment_control.dart';
import 'package:color_dart/color_dart.dart';
import 'package:flustars/flustars.dart';
class salesAnalysis extends StatefulWidget {
  @override
  _salesAnalysisState createState() => _salesAnalysisState();
}

class _salesAnalysisState extends State<salesAnalysis> {
  List<String> tabs;
  List<String> tabsc; //条件汇总选项
  List  lstitle;
  List datalist;
  int selectedIndex;
  int selectedIndexc;
  String Str;
  String Strc;
  String BeginDate;
  String EndDate;
  double dwidth;
  double cwidth;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabs =[ '今天','昨天','近7天','近30天','自定义'];
    dwidth=tabs.length * 60.0;
    selectedIndex =0;
    Str='今天';
    BeginDate =DateUtil.formatDate(DateTime.now(),format: 'yyyy-MM-dd');
    EndDate =DateUtil.formatDate(DateTime.now(),format:'yyyy-MM-dd');

    tabsc =[ '店铺','品类','品牌','厂商','导购','销售排行'];
    selectedIndexc =0;
    cwidth=tabsc.length * 60.0;
    Strc='店铺';
    lstitle =['名次','店铺','数量','金额'];
    datalist=[
      {'Name':'广州广州广州广州广州广州广州广州广州广州','Quantity':3,'Amount':900.00},
      {'Name':'广州1','Quantity':3,'Amount':900.00},
      {'Name':'广州2','Quantity':3,'Amount':900.00},
      {'Name':'广州3','Quantity':3,'Amount':900.00},
      {'Name':'广州4','Quantity':3,'Amount':900.00}];
  }



  @override
  Widget build(BuildContext context) {
    return Container(
           child: Scaffold(
             appBar:PreferredSize(
                 child:
                 AppBar(
                   title: const Text('零售分析',textAlign: TextAlign.center,style: TextStyle(fontSize: 18.0),),
                   centerTitle: true,
                   backgroundColor:hex('#108ee9'),

                   actions: <Widget>[

                   ],
                 ),
                 preferredSize: Size.fromHeight(40.0)
             ),
             body: _Col(context),//主体显示
           ),
    );
  }


  //主体显示
  Widget  _Col(BuildContext context){
    return Column(
       children: <Widget>[
         Container(
           width: double.infinity,
           margin: EdgeInsets.only(top:10.0), //tabs 改变长度时要重新安装apk不然会把项目长度不够错误 width:420 改为动态算看看会不会错
           child:  SegmentControl(tabs:tabs, width:dwidth,normalTitleStyle: TextStyle(fontSize: 14.0,color: Colors.blue),activeTitleStyle: TextStyle(fontSize: 14.0), selected: (_i, _s) {
             selectedIndex = _i;
             Str = _s;
             setState(() {
               if(selectedIndex ==0){
                 BeginDate =DateUtil.formatDate(DateTime.now(),format: 'yyyy-MM-dd');
                 EndDate =DateUtil.formatDate(DateTime.now(),format: 'yyyy-MM-dd');
               }else if(selectedIndex==1){
                 BeginDate =DateUtil.formatDate(DateTime.now().add(Duration(days: -1)),format: 'yyyy-MM-dd');
                 EndDate =DateUtil.formatDate(DateTime.now().add(Duration(days: -1)),format: 'yyyy-MM-dd');
               }else if(selectedIndex==2){
                 BeginDate =DateUtil.formatDate(DateTime.now().add(Duration(days: -7)),format: 'yyyy-MM-dd');
                 EndDate =DateUtil.formatDate(DateTime.now(),format: 'yyyy-MM-dd');
               }else if(selectedIndex==3){
                 BeginDate =DateUtil.formatDate(DateTime.now().add(Duration(days: -30)),format: 'yyyy-MM-dd');
                 EndDate =DateUtil.formatDate(DateTime.now(),format: 'yyyy-MM-dd');
               }
             });
           }),
         ),
       Container(
         margin: EdgeInsets.only(top:5.0,bottom: 5.0),
         child:   Row(
           crossAxisAlignment: CrossAxisAlignment.center,
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[ //"你选择了第$selectedIndex项,$Str"
             Text(BeginDate,style: TextStyle(color: Colors.red),),
             Text('至',style: TextStyle(color: Colors.red)),
             Text(EndDate,style: TextStyle(color: Colors.red)),
           ],
         ),
       ),
         Container(
           width: double.infinity,
           //tabs 改变长度时要重新安装apk不然会把项目长度不够错误 width:420 改为动态算看看会不会错
           child:  SegmentControl(tabs:tabsc, width:cwidth,normalTitleStyle: TextStyle(fontSize: 14.0,color: Colors.blue),activeTitleStyle: TextStyle(fontSize: 14.0), selected: (_i, _s) {
             selectedIndexc = _i;
             Strc = _s;
             setState(() {
               if(selectedIndexc ==0){
                 lstitle =['名次','店铺','数量','金额'];
               }else if(selectedIndexc==1){
                 lstitle =['名次','品类','数量','金额'];
               }else if(selectedIndexc==2){
                 lstitle =['名次','品牌','数量','金额'];
               }else if(selectedIndexc==3){
                 lstitle =['名次','厂商','数量','金额'];
               }else if(selectedIndexc==4){
                 lstitle =['名次','导购','数量','金额'];
               }else if(selectedIndexc==5){
                 lstitle =['名次','货号','数量','金额'];
               }
             });
           }),
         ),
         Container(
           height: 30.0,
           width: double.infinity,
           decoration: BoxDecoration(
             border: Border(bottom:BorderSide(width: 1.0,color: hex('#dcdcdc'))),

           ),
           child: Row(
             crossAxisAlignment: CrossAxisAlignment.center,
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: lstitle.asMap().keys.map((key){
                //key 为数组的下标 显示标题
              // print(lstitle[key]);
               return _children(context, lstitle[key]);
             }).toList(),
           ),
         ),
        Expanded(
          child:ListView( //显示数据
                children: datalist.asMap().keys.map((key){
                       return _item(context,key,datalist[key]);
                  }).toList()
               ),

          ),
       ]


    );
  }

  Widget  _children(BuildContext context,map){
   print('map的值：${map}');
   return Text(map);
  }
  //list 的子项
  Widget  _item(BuildContext context,i,items){
    print('的值：${items}');
    return Container(
     // height: 30.0,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 1.0,color: hex('#DCDCDC')))
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,

        children: <Widget>[
            Text((i+1).toString()),
            Container(

              width: 80.0,
              child:   Text(items['Name'],softWrap:true,),
            ),


            Text(items['Quantity'].toString()),
            Text(items['Amount'].toString()),
        ],
      ),
    );
  }




}
