
import 'package:flutter/material.dart';
import 'package:my_app/baseCheck.dart';
//import 'package:segment_control/segment_control.dart';
import 'package:my_app/component/seg_control.dart';
import 'package:color_dart/color_dart.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:cool_ui/cool_ui.dart';
import 'package:my_app/SelectDate.dart';
class salesAnalysis extends StatefulWidget {
  @override
  _salesAnalysisState createState() => _salesAnalysisState();
}

class _salesAnalysisState extends State<salesAnalysis>  {
  List<String> tabs;
  List<String> tabsc; //条件汇总选项
  List  lstitle;
  List datalist;
  List<String> poplist;
  int selectedIndex;
  int selectedIndexc;
  String Str;
  String Strc;
  String BeginDate;
  String EndDate;
  double dwidth;
  double cwidth;

  int _currentSelection = 0;


  ScrollController _scrollController =new ScrollController();
  int _page;  //加载的页数
  bool isLoading;//是否正在加载数据

  /**
   * 上拉加载更多
   */
  Future _getMore() async {
    int len=datalist.length;

    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
      await Future.delayed(Duration(seconds: 1), () {
        print('加载更多');
        setState(() {
          // list.addAll(List.generate(5, (i) => '第$_page次上拉来的数据'));
          for(int i=len;i<len+15;i++){
            Map map={'Name':'广州${i}','Quantity':i,'Amount':900.45};
            datalist.add(map);
          }
          _page++;
          isLoading = false;
        });
      });
    }
  }



  @override
  void initState() {
    // TODO: implement initState

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
   /* datalist=[
      {'Name':'广州','Quantity':3,'Amount':900.00},
      {'Name':'广州1','Quantity':3,'Amount':900.45},
      {'Name':'广州2','Quantity':3,'Amount':900.55},
      {'Name':'广州3','Quantity':3,'Amount':900.65},
      {'Name':'广州4','Quantity':3,'Amount':900.75}]; */
    _page =1;
    isLoading =false;
    datalist =[];
    for (int i=0;i<15;i++){
      Map map =new Map();
      map['Name'] ='广州${i+1}';
      map['Quantity'] =i+1;
      map['Amount'] =900.45;
      print('初始化中的:${map}');
      datalist.add(map);
    }

    poplist=['部门类别','店铺'];

    _scrollController.addListener((){
      if(_scrollController.position.pixels ==_scrollController.position.maxScrollExtent){
        print('滑动到了最底部');
        _getMore();
      }
    });
    super.initState();
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose(); //重要
  }

  @override
  Widget build(BuildContext context) {



    print('宽度：${ScreenUtil.getInstance().screenWidth}');
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
        bottomNavigationBar: Container(
          width: ScreenUtil.getInstance().screenWidth,//double.infinity,
          height: 62.0,
          decoration: BoxDecoration(
            border: Border(top:BorderSide(width: 1.0,color: hex('#DCDCDC')),
            ),
          ),
          child: Column(
            children: <Widget>[
              Container(
                width: ScreenUtil.getInstance().screenWidth,//double.infinity,
                height: 30.0,
                child:    Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text('合计',style:TextStyle(color: Colors.red)),
                    Text('2',style:TextStyle(color: Colors.red)),
                    Text('338.00',style:TextStyle(color: Colors.red)),
                  ],
                ),
              ),
              Container(
                width:ScreenUtil.getInstance().screenWidth,// double.infinity,
                height: 30.0,
                decoration: BoxDecoration(
                  border: Border(top:BorderSide(width: 1.0,color: hex('#DCDCDC')),
                  ),
                ),
                child:    Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(//ScreenUtil.getInstance().screenWidth
                      width:ScreenUtil.getInstance().screenWidth/2,//double.infinity, //ScreenUtil.getScreenW(context)/2.0, 没有得到的是一半

                      decoration: BoxDecoration(
                        //  color: Colors.orange,
                          border: Border(right: BorderSide(width: 1.0,color:  hex('#696969')))
                      ),

                     child: _sortButton("排序","右下角内容")

                    ),

                    Container(//ScreenUtil.getInstance().screenWidth
                      width:ScreenUtil.getInstance().screenWidth/2,//double.infinity, //ScreenUtil.getScreenW(context)/2.0, 没有得到的是一半
                      height: 30.0,
                      decoration: BoxDecoration(
                        //       color: Colors.orange,
                          border: Border(right: BorderSide(width: 1.0,color:  hex('#696969')))
                      ),
                      child:   _buildPopoverButton("筛选","右下角内容"),
                       //Text('筛选',style:TextStyle(color: hex('#696969'),),textAlign: TextAlign.center,),
                    ),


                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //自定义 需要多次点击 所以重写了组件
  _zdyonTap(int i){ //这里不管是否选中不能选，这里正是解决这个问题，不能多次点的问题
    if(i==4) //这里是自定义时间的
    {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SelectDate())).then((res) {
       if (res != null) {
          // print(val);
           setState(() {
             BeginDate = res['BeginDate'];
             EndDate = res['EndDate'];
             print('结束时间:${EndDate}');
           });
        }
      });
    }
  }

  //主体显示
  Widget  _Col(BuildContext context){
    return Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top:10.0), //SegmentControl 改了一下，同时也保留原来的 tabs 改变长度时要重新安装apk不然会把项目长度不够错误 width:420 改为动态算看看会不会错
            child:SegControl(tabs:tabs, width:dwidth,doubleTap:_zdyonTap,normalTitleStyle: TextStyle(fontSize: 14.0,color: Colors.blue),activeTitleStyle: TextStyle(fontSize: 14.0), selected: (_i, _s) {
              selectedIndex = _i;
              Str = _s;
              //print('进入方法aa');
             /* var hide = showWeuiLoadingToast(context:context);
              Future.delayed(Duration(seconds: 5),(){
                hide();
              }); */

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
                }//else if(selectedIndex==4){


                //}
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
            child:  SegControl(tabs:tabsc, width:cwidth,normalTitleStyle: TextStyle(fontSize: 14.0,color: Colors.blue),activeTitleStyle: TextStyle(fontSize: 14.0), selected: (_i, _s) {
              selectedIndexc = _i;
              Strc = _s;
              var hide = showWeuiLoadingToast(context:context);
            //  Future.delayed(Duration(seconds: 5),(){
                hide();
           //   });
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
    Flexible(//Expanded(
            child:ListView.builder( //显示数据
                controller: _scrollController,//滚动控制器
                itemCount: datalist.length+1,
                itemBuilder: _renderRow,
            ),

          ),
        ]


    );
  }
 //build 中 i 为下标
  Widget _renderRow(BuildContext context,int i) {
    if (i < datalist.length) {
      return Container(
        // height: 30.0,
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(width: 1.0, color: hex('#DCDCDC')))
        ),
        child:
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text((i + 1).toString(), style: TextStyle(height: 2.0)),
            Container(

              width: 80.0,
              child: Text(
                  datalist[i]['Name'], softWrap: true, style: TextStyle(height: 1.0)),
            ),


            Text(datalist[i]['Quantity'].toString(), style: TextStyle(height: 2.0)),
            Text(datalist[i]['Amount'].toString(), style: TextStyle(height: 2.0)),
          ],
        ),
      );
    }
    return _getMoreWidget();
  }



  Widget  _children(BuildContext context,map){
    print('map的值：${map}');
    return Text(map);
  }

  //弹出菜单 筛选条件
  Widget _buildPopoverButton(String btnTitle,String bodyMessage){
     setState(() {
       poplist.clear();
       if(btnTitle=='排序'){
         poplist=['数量','金额'];
       } else if(btnTitle=='筛选' && selectedIndexc==0){

         poplist=['部门类别','店铺'];

       }else if(btnTitle=='筛选' && selectedIndexc==1){

         poplist=['品类'];

       }else if(btnTitle=='筛选' && selectedIndexc==2){

         poplist=['品牌'];

       }else if(btnTitle=='筛选' && selectedIndexc==3){

         poplist=['厂商'];

       }else if(btnTitle=='筛选' && selectedIndexc==4){

         poplist=['导购'];

       }else if(btnTitle=='筛选' && selectedIndexc==5){

         poplist=['货号'];

       }
     });
    return Container(
      width: ScreenUtil.getInstance().screenWidth/2,
       // padding:  EdgeInsets.all(5.0),
        child:CupertinoPopoverButton(

            child: Container(
              width: 80.0,
              height: 30.0,
              decoration: BoxDecoration(
                //  color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                //   boxShadow: [BoxShadow(color: Colors.black12,blurRadius: 5.0)]
              ),
              child: Center(child:Text(btnTitle,style:TextStyle(color: hex('#696969')),)),
            ),
            popoverBuild: (context) {
//              return Text("satatastas");
              return CupertinoPopoverMenuList(

                children: poplist.asMap().keys.map((i){
                  //修正 bug的地方标志一下
                   //改的 插件的点击返回，错误，不然返回菜单还是打开的，有改动 D:\flutter\.pub-cache\hosted\pub.flutter-io.cn\cool_ui-0.2.2\lib\widgets\popover\cupertino_popover.dart
                        return CupertinoPopoverMenuItem(child: Text(poplist[i],style: TextStyle(height: 2.0),textAlign: TextAlign.center,),
                          onTap: (){

                          print('aaa:'+poplist[i]);
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>baseCheck(TableTag:poplist[i]))).then((val){
                            print('返回的值：'+val.toString());
                            Navigator.pop(context);
                          });
                          return true;

                        },
                        isTapClosePopover: false,
                        );
                }).toList()
                /* <Widget>[
                  CupertinoPopoverMenuItem(leading: Icon(Icons.add),child: Text("新增"), ),
                  CupertinoPopoverMenuItem(leading: Icon(Icons.edit),child: Text("修改"),),
                  CupertinoPopoverMenuItem(leading: Icon(Icons.delete),child: Text("删除"),)
                ], */
              );
            })

    );

  }

  Widget _sortButton(String btnTitle,String bodyMessage){

    return Container(
      width: ScreenUtil.getInstance().screenWidth/2,
      //  padding:  EdgeInsets.all(5.0),
        child:CupertinoPopoverButton(
            child: Container(
              width: 80.0,
              height: 30.0,
              decoration: BoxDecoration(
                //  color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                //   boxShadow: [BoxShadow(color: Colors.black12,blurRadius: 5.0)]
              ),
              child: Center(child:Text(btnTitle,style:TextStyle(color: hex('#696969')),)),
            ),
            popoverBuild: (context) {
//              return Text("satatastas");
              return CupertinoPopoverMenuList(
                  children:
                 <Widget>[
                  CupertinoPopoverMenuItem(child: Text("数量",style: TextStyle(height: 2.0),textAlign: TextAlign.center,),),
                  CupertinoPopoverMenuItem(child: Text("金额",style: TextStyle(height: 2.0),textAlign: TextAlign.center,),),
              /*  CupertinoPopoverMenuItem(leading: Icon(Icons.delete),child: Text("删除"),)
              */
                ],
              );
            })

    );

  }
  /**
   * 加载更多时显示的组件,给用户提示
   */
  Widget _getMoreWidget() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              '加载中...',
              style: TextStyle(fontSize: 16.0),
            ),
            CircularProgressIndicator(
              strokeWidth: 1.0,
            )
          ],
        ),
      ),
    );
  }



}