
import 'dart:convert';

import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flustars/flustars.dart';
import './utils/Request.dart';


class BaseCheckList extends StatefulWidget {
  @override
  _BaseCheckListState createState() => _BaseCheckListState();
}

class _BaseCheckListState extends State<BaseCheckList> {

  TextEditingController keyword =TextEditingController();
  List dataList =[];//里面的类别不要声明map否则数据返回的是List<dynamic>类型的
  ScrollController _scrollController = ScrollController(); //listview的控制器
  int _page = 1; //加载的页数
  bool isLoading = false; //是否正在加载数据
  List checkedList=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    keyword.text='';

    _getData();
    _scrollController.addListener((){ //添加监听
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
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
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          title: Text('资料选择',style: TextStyle(fontSize: 18.0),),
          centerTitle: true,
        ),
        preferredSize: Size.fromHeight(40.0),
      ),
      body:_Col(context), //主体
      bottomNavigationBar: Container(

        height: 40.0,
        child: Text('已选中:${checkedList.length}'),
      ),
    );
  }

  Widget _Col(BuildContext context){
    return Column(
        children: <Widget>[
          TextField(
            controller: keyword,
            decoration: InputDecoration(
              hintText: '请输入内容查询',
              hintStyle: TextStyle(fontSize: 16.0),
            ),
            onChanged: _search,
           ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: _onRefresh,
              child: Container(
                width: ScreenUtil.getInstance().screenWidth,
                child: ListView.builder(
                  itemCount: dataList.length+1,
                  controller: _scrollController,
                  itemBuilder: _renderData,
                ),
              ),
            ),
          ),
        ],
    );
  }

  void _search(String key1){
    if(key1.length >3){
      setState(() {
        _page =1;
      });
      Future.delayed(Duration(seconds: 3),() async{
        print('打印key:${key1}');
        await Request().post('/select.do?getGoods', {'currPage':_page,'param':key1}).then((val){
          setState(() {
            print('首次加载中的：${val}');
            var data =jsonDecode(val.toString());
            dataList =data['obj'];
              dataList.forEach((v){
          v['isCheck']=false;
        });
          });
        });
      });
    }
  }


  void _getData() async{

    var map={'currPage':_page,'param':''};
    await Request().post('/select.do?getGoods', map).then((val){
      setState(() {
        print('首次加载中的：${val}');
        var data =jsonDecode(val.toString());
        dataList =data['obj'];
        dataList.forEach((v){
          v['isCheck']=false;
        });
      });
    });
  }

//渲染数据 重要
 Widget  _renderData(BuildContext context,int index){
   if (index < dataList.length) {
     return Column(
       children: <Widget>[
         CheckboxListTile(
           title: Text(dataList[index]['Name']),
           value: dataList[index]['isCheck'],
           //  activeColor: Color.fromRGBO(236, 236, 236, 1.0),
           //  checkColor: hex('#108ee9'),
        //   isThreeLine: false,
       //    subtitle: Text('aaaa'),
           dense: false,
        //   secondary: Text('bbbbb'),
           onChanged: (v) {
             print(v);
             setState(() {
               dataList[index]['isCheck']=v;
               if(v && !checkedList.contains(dataList[index]) ){
                 checkedList.add(dataList[index]);
               }else if(checkedList.contains(dataList[index]) && !v){
                 checkedList.remove(dataList[index]);
               }

             });
           },
         ),
         Divider(),
       ],
     );

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
        dataList.clear(); //重新查询
        _page =1;//重新查询1
        _getData();
      });
    });
  }



  /**
   * 上拉加载更多
   */
  Future _getMore() async {
    int len=dataList.length;

    if (!isLoading) {
      setState(() {
        isLoading = true;
        _page++; //因为这里要添加页数请求数据行，所以这里要放在这里
      });

        print('加载更多');


      var map={'currPage':_page,'param':''};
      await Request().post('/select.do?getGoods', map).then((val){
        setState(() {
          print('更多加载中的：${val}');
          var data =jsonDecode(val.toString());
          List obj =data['obj'];
          obj.forEach((v){
            v['isCheck']=false;
          });
          dataList.addAll(obj);
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

}
