
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:color_dart/color_dart.dart';
import 'package:flustars/flustars.dart';
import './utils/Request.dart';
import './model/GoodsTypeModel.dart';
import 'package:provider/provider.dart';
import './model/GoodsSubType.dart';
import './provider/SubTypeProvider.dart';
class GoodsType_Page extends StatefulWidget {
  @override
  _GoodsTypeState createState() => _GoodsTypeState();
}

class _GoodsTypeState extends State<GoodsType_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          title: Text('货品分类页',style: TextStyle(fontSize: 18.0),),
          centerTitle: true,
        ),
       preferredSize: Size.fromHeight(40.0),
      ),
      body: Container(
        child: Row(
          children: <Widget>[
            LeftGoodsTypeNav(),
            Column(
              children: <Widget>[
                RightGoodsTypeNav(),
                GoodsList(),
              ],
            ),

          ],
        ),
      ),
    );
  }
}

//左则类别导航
 class LeftGoodsTypeNav extends StatefulWidget {
   @override
   _LeftGoodsTypeNavState createState() => _LeftGoodsTypeNavState();
 }

 class _LeftGoodsTypeNavState extends State<LeftGoodsTypeNav> {

   List<GoodsTypeModel> dataList=[];
   int page=1;
   int selectIndex=3;


   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
   }

   @override
   Widget build(BuildContext context) {
     return Container(
       width: 100.0,
       decoration: BoxDecoration(
         border: Border.all(width: 1.0,color: Colors.black12)
       ),
       child: ListView.builder(
             itemCount: dataList.length,
             itemBuilder: (context,index){
               return _leftInkWell(index);
             },
       ),
     );
   }

   Widget _leftInkWell(index){
     return InkWell(
       onTap: (){
         var ls= dataList[index].subList;
         //dynamic转成对象
         List<GoodsSubType> gt =new List<GoodsSubType>();
         ls.forEach((v){
           gt.add(GoodsSubType.fromJson(v));
         });
        setState(() {
          selectIndex =index;
        });
         Provider.of<SubTypeProvider>(context).getSubTypeList(gt);// 传值
         print('ls的值:${ls}');
         print('gt的值:${Provider.of<SubTypeProvider>(context).datalist}');
       },
       child: Container(
         height: ScreenUtil.getInstance().getHeight(70.0),
         padding: EdgeInsets.only(left:10.0,top: 20.0),
         decoration: BoxDecoration(
           color: selectIndex==index?Color.fromRGBO(236, 236, 236, 1.0):Colors.white,
           border: Border(bottom: BorderSide(width:1.0,color: Colors.black12))
         ),
         child: Text('${dataList[index].Name}'),
       ),
     );
   }

   _getData() async{
     Request req=Request();
     var map={'currPage':page,'param':''};
     await  req.post("/select.do?getsubTypeForGoodsType", map).then((val){
       var data =jsonDecode(val.toString());
       GoodsTypeModelList list=GoodsTypeModelList.fromJson(data);
       setState(() {
      dataList=list.obj;//这个列表
      page++;
    });
     });
   }
 }

 //右侧
 class RightGoodsTypeNav extends StatefulWidget {
   @override
   _RightGoodsTypeNavState createState() => _RightGoodsTypeNavState();
 }

 class _RightGoodsTypeNavState extends State<RightGoodsTypeNav> {
   @override
   Widget build(BuildContext context) {
     var dataright=  Provider.of<SubTypeProvider>(context);
     return  Container(
           height: 40.0,
           width: ScreenUtil.getInstance().screenWidth-100.0,
           decoration: BoxDecoration(
             border: Border(bottom:BorderSide(width: 1.0,color: Colors.black12))
           ),
           child: ListView.builder(
             scrollDirection: Axis.horizontal,
             itemCount: dataright.datalist.length,
             itemBuilder: (context,index){
               return _rightInkWell(index,dataright.datalist[index]);
             },
           ),
     );


   }

   Widget _rightInkWell(int index,GoodsSubType item){

     return InkWell(
       onTap: (){
         Provider.of<SubTypeProvider>(context).changeChildIndex(index);
       },
       child: Container(
         padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
         child: Text('${item.Name}',style: TextStyle(color: Provider.of<SubTypeProvider>(context).childIndex==index ? Colors.pink:Colors.black),),
       ),
     );
   }
 }

//货品列表

 class GoodsList extends StatefulWidget {


   @override
   _GoodsListState createState() => _GoodsListState();
 }

 class _GoodsListState extends State<GoodsList> {
   ScrollController _scrollController = ScrollController(); //listview的控制器
    List glist;
    int _page=1;
    bool isLoading = false; //是否正在加载数据
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    glist=[];
    _getData();
    _scrollController.addListener((){
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print('滑动到了最底部');

        _getMore();
      }

    });
  }
   @override
   void dispose() {
     // TODO: implement dispose
     super.dispose();
     _scrollController.dispose();
   }
   @override
   Widget build(BuildContext context) {
     if(glist.length >0){
       return Expanded(
         child:RefreshIndicator(
           onRefresh: _onRefresh,
           child: Container(
             width: ScreenUtil.getInstance().screenWidth-100.0,
             child: ListView.builder(
               itemCount: glist.length+1,
               controller: _scrollController,
               itemBuilder: _renderData,
             ),
           ),
         ),

       );
     }else{
       return Text('暂无数据！');
     }

   }
 //显示数据 每一条数据
   Widget _renderData(BuildContext context, int index) {
     if (index < glist.length) {
       return glistitem(index);
     }
     return _getMoreWidget();
   }


    /**
     * 下拉刷新方法,为list重新赋值
     */
    Future<Null> _onRefresh() async {
      await Future.delayed(Duration(seconds: 3), () {
        print('refresh');
        setState(() {
          _page =1;//重新查询1
         _getData();
        });
      });
    }


   _getData() async{ //用于首次加载
      Request req=Request();
    var map={'currPage':_page,'param':''};
     await req.post('/select.do?getGoods', map).then((val){
       setState(() {
         print('首次加载中的：${val}');
         var data =jsonDecode(val.toString());
          glist =data['obj'];

       });
     });
   }

   /**
    * 上拉加载更多
    */
   Future _getMore() async {
     if (!isLoading) {
       setState(() {
         isLoading = true;
         _page++;
       });
       print('加载更多');
       Request req=Request();
       var map={'currPage':_page,'param':''};
       await req.post('/select.do?getGoods', map).then((val){
         setState(() {
           var data =jsonDecode(val.toString());
           print('加载更多中的：${val}');
           glist.addAll(data['obj']);
           isLoading = false;
         });
       });

     }
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




  Widget  _goodsImg(int index){
    return Container(
      height: 100,
      width: 80.0,
     child: (glist[index]['img']==null || glist[index]['img']=='')? DecoratedBox(
       decoration: BoxDecoration(
         shape: BoxShape.rectangle,
         borderRadius: BorderRadius.circular(10.0),
         // color: Colors.red,
         border: new Border.all(
           width: 1.0,
           color: Colors.black12,
         ),
         image: DecorationImage(
           image: AssetImage('images/nopic.jpg'),
           centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0,
               730.0), //这个属性是填满事个div  Container 没有这个就是剧中显示
         ),
       ),
     ):Image.network(glist[index]['img']),
    );
    }

    Widget  _goodsName(int index){
      return Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(5.0),
        child: Text(
          glist[index]['Name'],
          maxLines: 2,
          overflow: TextOverflow.ellipsis,),
      );
    }

    Widget  _goodsPrice(int index){
      return Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              '零售价:${glist[index]['RetailSales']}',
              style: TextStyle(color: Colors.pink),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,),
            SizedBox(width: 10.0,),
            Text(
              '${glist[index]['TradePrice']}',
              style: TextStyle(color: Colors.black26,decoration: TextDecoration.lineThrough,),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,),
          ],
        ),

      );
    }

    Widget glistitem(int index){
     return InkWell(
       child: Container(
         width: double.infinity-7,
         margin: EdgeInsets.only(left: 5.0),
         padding: EdgeInsets.only(
           top: 5.0,
           bottom: 5.0
         ),
         decoration: BoxDecoration(
           color: Colors.white,
           border: Border(bottom:BorderSide(width: 1.0,color: Colors.black12))
         ),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: <Widget>[
             _goodsImg(index),
             Column(
               children: <Widget>[
                 _goodsName(index),
                 _goodsPrice(index)

               ],
             ),
           ],
         ),
       ),
     );
    }

 }






