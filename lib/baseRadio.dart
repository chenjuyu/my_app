
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:color_dart/color_dart.dart';

class baseRadio extends StatefulWidget {
  @override
  _baseRadioState createState() => _baseRadioState();
}

class _baseRadioState extends State<baseRadio> {

  List<String> items = ["1", "2", "3", "4", "5", "6", "7", "8"];
  RefreshController _refreshController =
  RefreshController(initialRefresh: false);

  void _onRefresh() async{
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async{
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    items.add((items.length+1).toString());
    if(mounted)
      setState(() {

      });
    _refreshController.loadComplete();
  }

  TextEditingController keyword=new TextEditingController();

   @override
  void initState() {
    // TODO: implement initState
     keyword.text ='';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: PreferredSize(
            child:
            AppBar(
              title: const Text('资料选择',textAlign: TextAlign.center,style: TextStyle(fontSize: 18.0),),
              centerTitle: true,
              backgroundColor:hex('#108ee9'),

              actions: <Widget>[



              ],
            ),
            preferredSize: Size.fromHeight(40.0)),
        body: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: TextField(
                controller: keyword,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    hintText: '请输入关键字搜索'
                ),
              ),
            ),
            Expanded(
              child: SmartRefresher(
                enablePullDown: true,
                enablePullUp: true,
                header: WaterDropHeader(),
                footer: CustomFooter(
                  builder: (BuildContext context,LoadStatus mode){
                    Widget body ;
                    if(mode==LoadStatus.idle){
                      body =  Text("上拉加载");
                    }
                    else if(mode==LoadStatus.loading){
                      body =  CupertinoActivityIndicator();
                    }
                    else if(mode == LoadStatus.failed){
                      body = Text("加载失败！点击重试！");
                    }
                    else if(mode == LoadStatus.canLoading){
                      body = Text("松手,加载更多!");
                    }
                    else{
                      body = Text("没有更多数据了!");
                    }
                    return Container(
                      height: 55.0,
                      child: Center(child:body),
                    );
                  },
                ),
                controller: _refreshController,
                onRefresh: _onRefresh,
                onLoading: _onLoading,
                child: ListView.builder(
                  itemBuilder: (c, i) => Card(child: Center(child: Text(items[i]))),
                  itemExtent: 100.0,
                  itemCount: items.length,
                ),
              ),
            ),


          ],
        ),

      ),
    );
  }
}
