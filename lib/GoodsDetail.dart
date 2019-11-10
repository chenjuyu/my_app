import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Goods {
  final String GoodsID = "";
  final String Code = "";
  final String Name = "";
  final double RetailSales = 0.0;
}

class GoodsDetail extends StatefulWidget {
  final Goods goods;

  GoodsDetail({Key key, this.goods}) : super(key: key);

//list
  final List formList = [
    {
      "title": "影视特效",
      "type": 0,
    },
    {"title": "室内设计", "type": 1},
    {"title": "游戏原画", "type": 2},
    {"title": "次时代", "type": 3},
    {"title": "UI设计", "type": 4},
    {"title": "后期合成", "type": 5},
    {"title": "后期2", "type": 6},
    {"title": "后期3", "type": 7},
    {"title": "后期4", "type": 8},
    {"title": "后期5", "type": 9},
    {"title": "后期6", "type": 10},
  ];

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return new GoodsDetailState();
  }
}

class GoodsDetailState extends State<GoodsDetail> {
  @override
  Widget build(BuildContext context) {
    return layout(context);
  }

  //  int groupValue=1;
  int groupValue = 0;

  void updateGroupValue(int v) {
    setState(() {
      groupValue = v;
    });
  }

  Widget listitem(context, value) {
    var deviceSize = MediaQuery.of(context).size;
    print(value['type']);
    return groupValue == value['type']
        ? RaisedButton(
            color: hexToColor('#108ee9'), //Colors.black,
            onPressed: () {
              print('切换${value}');
              updateGroupValue(value['type']);
            },
            child: Text(
              value['title'],
              style: TextStyle(color: Colors.white),
              overflow: TextOverflow.ellipsis,
            ),
          )
        : OutlineButton(
            onPressed: () {
              print('切换${value}');
              updateGroupValue(value['type']);
            },
            child: Text(value['title'], overflow: TextOverflow.ellipsis),
          );
  } //这里是代码的关键比较 当value和groupValue一致的时候则选中 设置选中样式和没选中样式



  Widget layout(BuildContext context) {
    List<Widget> sizelist = <Widget>[
      Container(
        width: double.infinity,
        alignment: Alignment(0,0),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 1.0,
                    color:Colors.black12
                ))

        ),
        child: Row(
          children: <Widget>[
            Container(
              width: 80.0,
              alignment: Alignment(0,0),
              child: Text('35'),
            ),
            Container(
              width: 100.0,
              alignment: Alignment(0,0),
              child: Text('3/5'),
            ),
            Expanded(
              child:
              Container(
                // color: Colors.amber,
                height: 35.0,
                alignment: Alignment.center,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.remove_circle_outline,size: 35.0,),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 35.0,
                        maxWidth: 35.0,
                      ),
                      child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: (const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide:BorderSide(width: 1.0,color: Colors.black12),
                            ),
                            contentPadding: const EdgeInsets.symmetric(vertical: 4.0),
                          ))),
                    ),
                    Icon(Icons.add_circle,size: 35.0)
                  ],
                ) ,


              ),



            )
          ],
        ),
      ),
      Container(
        width: double.infinity,
        alignment: Alignment(0,0),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 1.0,
                    color:Colors.black12
                ))

        ),
        child: Row(
          children: <Widget>[
            Container(
              width: 80.0,
              alignment: Alignment(0,0),
              child: Text('35'),
            ),
            Container(
              width: 100.0,
              alignment: Alignment(0,0),
              child: Text('3/5'),
            ),
            Expanded(
              child:
              Container(
                // color: Colors.amber,
                height: 35.0,
                alignment: Alignment.center,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.remove_circle_outline,size: 35.0,),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 35.0,
                        maxWidth: 35.0,
                      ),
                      child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: (const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide:BorderSide(width: 1.0,color: Colors.black12),
                            ),
                            contentPadding: const EdgeInsets.symmetric(vertical: 4.0),
                          ))),
                    ),
                    Icon(Icons.add_circle,size: 35.0)
                  ],
                ) ,


              ),



            )
          ],
        ),
      ),
      Container(
        width: double.infinity,
        alignment: Alignment(0,0),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 1.0,
                    color:Colors.black12
                ))

        ),
        child: Row(
          children: <Widget>[
            Container(
              width: 80.0,
              alignment: Alignment(0,0),
              child: Text('35'),
            ),
            Container(
              width: 100.0,
              alignment: Alignment(0,0),
              child: Text('3/5'),
            ),
            Expanded(
              child:
              Container(
                // color: Colors.amber,
                height: 35.0,
                alignment: Alignment.center,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.remove_circle_outline,size: 35.0,),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 35.0,
                        maxWidth: 35.0,
                      ),
                      child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: (const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide:BorderSide(width: 1.0,color: Colors.black12),
                            ),
                            contentPadding: const EdgeInsets.symmetric(vertical: 4.0),
                          ))),
                    ),
                    Icon(Icons.add_circle,size: 35.0)
                  ],
                ) ,


              ),



            )
          ],
        ),
      ),
      Container(
        width: double.infinity,
        alignment: Alignment(0,0),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 1.0,
                    color:Colors.black12
                ))

        ),
        child: Row(
          children: <Widget>[
            Container(
              width: 80.0,
              alignment: Alignment(0,0),
              child: Text('35'),
            ),
            Container(
              width: 100.0,
              alignment: Alignment(0,0),
              child: Text('3/5'),
            ),
            Expanded(
              child:
              Container(
                // color: Colors.amber,
                height: 35.0,
                alignment: Alignment.center,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.remove_circle_outline,size: 35.0,),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 35.0,
                        maxWidth: 35.0,
                      ),
                      child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: (const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide:BorderSide(width: 1.0,color: Colors.black12),
                            ),
                            contentPadding: const EdgeInsets.symmetric(vertical: 4.0),
                          ))),
                    ),
                    Icon(Icons.add_circle,size: 35.0)
                  ],
                ) ,


              ),



            )
          ],
        ),
      ),
      Container(
        width: double.infinity,
        alignment: Alignment(0,0),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 1.0,
                    color:Colors.black12
                ))

        ),
        child: Row(
          children: <Widget>[
            Container(
              width: 80.0,
              alignment: Alignment(0,0),
              child: Text('35'),
            ),
            Container(
              width: 100.0,
              alignment: Alignment(0,0),
              child: Text('3/5'),
            ),
            Expanded(
              child:
              Container(
                // color: Colors.amber,
                height: 35.0,
                alignment: Alignment.center,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.remove_circle_outline,size: 35.0,),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 35.0,
                        maxWidth: 35.0,
                      ),
                      child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: (const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide:BorderSide(width: 1.0,color: Colors.black12),
                            ),
                            contentPadding: const EdgeInsets.symmetric(vertical: 4.0),
                          ))),
                    ),
                    Icon(Icons.add_circle,size: 35.0)
                  ],
                ) ,


              ),



            )
          ],
        ),
      ),
      Container(
        width: double.infinity,
        alignment: Alignment(0,0),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 1.0,
                    color:Colors.black12
                ))

        ),
        child: Row(
          children: <Widget>[
            Container(
              width: 80.0,
              alignment: Alignment(0,0),
              child: Text('35'),
            ),
            Container(
              width: 100.0,
              alignment: Alignment(0,0),
              child: Text('3/5'),
            ),
            Expanded(
              child:
              Container(
                // color: Colors.amber,
                height: 35.0,
                alignment: Alignment.center,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.remove_circle_outline,size: 35.0,),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 35.0,
                        maxWidth: 35.0,
                      ),
                      child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: (const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide:BorderSide(width: 1.0,color: Colors.black12),
                            ),
                            contentPadding: const EdgeInsets.symmetric(vertical: 4.0),
                          ))),
                    ),
                    Icon(Icons.add_circle,size: 35.0)
                  ],
                ) ,


              ),



            )
          ],
        ),
      ),    Container(
        width: double.infinity,
        alignment: Alignment(0,0),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 1.0,
                    color:Colors.black12
                ))

        ),
        child: Row(
          children: <Widget>[
            Container(
              width: 80.0,
              alignment: Alignment(0,0),
              child: Text('35'),
            ),
            Container(
              width: 100.0,
              alignment: Alignment(0,0),
              child: Text('3/5'),
            ),
            Expanded(
              child:
              Container(
                // color: Colors.amber,
                height: 35.0,
                alignment: Alignment.center,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.remove_circle_outline,size: 35.0,),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 35.0,
                        maxWidth: 35.0,
                      ),
                      child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: (const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide:BorderSide(width: 1.0,color: Colors.black12),
                            ),
                            contentPadding: const EdgeInsets.symmetric(vertical: 4.0),
                          ))),
                    ),
                    Icon(Icons.add_circle,size: 35.0)
                  ],
                ) ,


              ),



            )
          ],
        ),
      ),
      Container(
        width: double.infinity,
        alignment: Alignment(0,0),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 1.0,
                    color:Colors.black12
                ))

        ),
        child: Row(
          children: <Widget>[
            Container(
              width: 80.0,
              alignment: Alignment(0,0),
              child: Text('35'),
            ),
            Container(
              width: 100.0,
              alignment: Alignment(0,0),
              child: Text('3/5'),
            ),
            Expanded(
              child:
              Container(
                // color: Colors.amber,
                height: 35.0,
                alignment: Alignment.center,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.remove_circle_outline,size: 35.0,),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 35.0,
                        maxWidth: 35.0,
                      ),
                      child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: (const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide:BorderSide(width: 1.0,color: Colors.black12),
                            ),
                            contentPadding: const EdgeInsets.symmetric(vertical: 4.0),
                          ))),
                    ),
                    Icon(Icons.add_circle,size: 35.0)
                  ],
                ) ,


              ),



            )
          ],
        ),
      ),

    ];



    var layout1 = <Widget>[
      Container(
        height: 120,
        //dp 单位
        width: double.infinity,
        alignment: Alignment(-1.0, -1.0),
        decoration: BoxDecoration(
          border: new Border(
            bottom: BorderSide(
              width: 1.0,
              color: Colors.black12,
            ),
          ),
        ),
        child: Row(
          children: <Widget>[
            Container(
              // padding:EdgeInsets.only(top:2),
              height: 100,
              width: 80,
              child: DecoratedBox(
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
              ),
              margin: EdgeInsets.only(right: 10.0),
            ),
            Expanded(
              //  Container(
              //    alignment: Alignment(0, 0),
              //      width: 260.0,
              //    margin: EdgeInsets.only(left: 5.0),
              //    decoration: BoxDecoration(color: Colors.amber),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '货品编码:',
                          style: TextStyle(),
                        ),
                        Expanded(
                          child: Text(
                            '1222222222212222222222122222222221222222222212222222222',
                            style: TextStyle(),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '货品名称:',
                          style: TextStyle(),
                        ),
                        Expanded(
                          child: Text(
                            '服装',
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '零售价:',
                          style: TextStyle(),
                        ),
                        Expanded(
                          child: Text(
                            '599.00',
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '折扣:',
                          style: TextStyle(),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: 20.0,
                            maxWidth: 50.0,
                          ),
                          child: TextField(
                              decoration: (const InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 4.0),
                          ))),
                        ),
                        Text(
                          '单价:',
                          style: TextStyle(),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: 20.0,
                            maxWidth: 50.0,
                          ),
                          child: TextField(
                              decoration: (const InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 4.0),
                          ))),
                        ),
                      ],
                    ),
                  ]),
            ),
          ],
        ),
      ),
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(width: 1.0, color: Colors.black12))),
        //  height: auto,
        child: GridView.count(
          padding: EdgeInsets.all(5.0),
          //一行多少个
          crossAxisCount: 4,
          //滚动方向
          scrollDirection: Axis.vertical,
          // 左右间隔
          crossAxisSpacing: 5.0,
          // 上下间隔
          mainAxisSpacing: 10.0,
          //宽高比
          childAspectRatio: 1 / 0.45,
          shrinkWrap: true,
          children: widget.formList.map((value) {
            return listitem(context, value);
          }).toList(),
        ),
      ),
      Container(
        height: 30.0,
        alignment: Alignment(0, 0),
        margin: const EdgeInsets.only(top: 5.0),
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(width: 1.0, color: Colors.black12))),
        child: Row(
          children: <Widget>[
            Container(
              alignment: Alignment(0, 0),
              width: 80.0,
              child: Text('尺码'),
            ),
            Container(
              alignment: Alignment(0, 0),
              width: 100.0,
              child: Text('库存/采购数'),
            ),
            Expanded(
              child: Container(
                alignment: Alignment(0, 0),
                child: Text('数量'),
              ),
            )
          ],
        ),
      ),
      Expanded(
          child:
          Container(
            child: ListView(children:  sizelist)),
          ),

    ];

    _showDialog() {
      showDialog<Null>(
        context: context,
        child: new AlertDialog(content: new Text('退出当前界面'), actions: <Widget>[
          new FlatButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.of(context).pop();
              },
              child: new Text('确定'))
        ]),
      );
    }

    Future<bool> _requestPop() {
      _showDialog();
      return new Future.value(false);
    }

    return WillPopScope(
      child: Scaffold(
          //automaticallyImplyLeading 显示返回按扭
          appBar: PreferredSize(
              child: AppBar(
                  title: Text('货品详情'),
                  centerTitle: true,
                  backgroundColor: hexToColor('#108ee9'),
                  automaticallyImplyLeading: true),
              preferredSize: Size.fromHeight(40.0)),
          body: Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              children:layout1//<Widget>[]  抽出来单独写
            ),
          ),
          resizeToAvoidBottomPadding:true
       ),
      onWillPop: _requestPop,
    );
  }
}

void toast(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIos: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white);
}

//十六进制颜色值格式一般如：#ff0000，以#开头，后面跟着6个十六进制字符。
//而flutter中不能直接使用此类形式的颜色值，所以必须要转换为flutter颜色对象。
Color hexToColor(String s) {
  // 如果传入的十六进制颜色值不符合要求，返回默认值
  if (s == null ||
      s.length != 7 ||
      int.tryParse(s.substring(1, 7), radix: 16) == null) {
    s = '#999999';
  }

  return new Color(int.parse(s.substring(1, 7), radix: 16) + 0xFF000000);
}
