import 'package:flutter/material.dart';
import 'package:flustars/flustars.dart';
class Person{
  String id;
  String Name;

  Person(this.id, this.Name);

}
class baseCheck extends StatefulWidget {
   String TableTag;

  baseCheck({Key key,this.TableTag}):super(key:key);

  @override
  _baseCheckState createState() => _baseCheckState();
}

class _baseCheckState extends State<baseCheck> {
  final List<Person> list = List() ;
  bool _isCheck = false;
  List<bool> _isChecks = List();
  List _checkList =[]; //用于保存选择数据
  String tableType;
  TextEditingController keyword=TextEditingController();

  ScrollController _scrollController = ScrollController(); //listview的控制器
  int _page = 1; //加载的页数
  bool isLoading = false; //是否正在加载数据



  /**
   * 上拉加载更多
   */
  Future _getMore() async {
    int len=list.length;

    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
      await Future.delayed(Duration(seconds: 1), () {
        print('加载更多');
        setState(() {
          // list.addAll(List.generate(5, (i) => '第$_page次上拉来的数据'));
          for(int i=len;i<len+15;i++){
            list.add(Person('标题$i', '内容$i'));
            _isChecks.add(false);
          }
          _page++;
          isLoading = false;
        });
      });
    }
  }


  @override
  void initState() {
    keyword.text ='';
    tableType=widget.TableTag; //传后台接收

    print('tableType:${tableType}');

    for(int i=0;i<20;i++){
      list.add(Person('标题$i', '内容$i'));
      _isChecks.add(false);
    }
    print(_isChecks);

    _scrollController.addListener(() {
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

    return Scaffold(
      appBar:PreferredSize(
        child:  AppBar(
          elevation: 0.0,
          centerTitle: true,
          title: Text('资料选择',textAlign: TextAlign.center,style: TextStyle(fontSize: 18.0),),
        ),
        preferredSize:Size.fromHeight(40.0),
      ),
      body:Column(//Refresh(
        // onFooterRefresh: onFooterRefresh,
        //onHeaderRefresh: onHeaderRefresh,
          children:<Widget>[
            Container(
              child: TextField(
                controller: keyword,
                decoration: InputDecoration(
                    hintText: '请输入关键字查询'
                ),
              ),
            ),
            Expanded(
              child:
              ListView.builder(
                controller: _scrollController,
                itemCount: list.length+1,
                itemBuilder: _renderRow, //抽离独立写

              ),

            )

          ]
      ),
    bottomNavigationBar:
    InkWell(
      onTap: (){
       Navigator.pop(context,_checkList);
      },
      child:  Container(
        width: ScreenUtil.getInstance().screenWidth,
        height: 35.0,
        alignment: Alignment(0,0), //居中的意思
        decoration: BoxDecoration(
            color: Colors.orange
        ),
        child: Text('确定',style: TextStyle(color: Colors.white)),
      ),
    ),

    );
  }

  Widget _renderRow(BuildContext context, int index) {
    if (index < list.length) {
      return Column(
        children: <Widget>[
          GestureDetector(
            child: Container(
              height: 30.0,
              padding: EdgeInsets.only(left: 20.0),
              //  width: 360.0,
              child: Row(
                children: <Widget>[
                  Expanded(child: Text(list[index].Name)),
                  Checkbox(
                      activeColor: Colors.blue,//激活时的颜色
                      value: _isChecks[index],
                      onChanged: (bool val){
                        setState(() {
                          if(!_checkList.contains(list[index]) && val){//没有包含 和选择就要添加 进去
                            _checkList.add(list[index]);
                          }else if(_checkList.contains(list[index]) && !val){
                            _checkList.remove(list[index]);
                          }
                          _isChecks[index] = val;
                          print('已选的值:${_checkList.toString()}');
                        });
                      }),
                ],
              ),

//                    child: Text(list[index].content),
            ),
            onTap: (){
              print(index);
              //  Toast.show('点击了:${index}', context,duration: 2,gravity: 0);
            },
          ),
          Divider(),
        ],
      );
    }
    return _getMoreWidget();
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