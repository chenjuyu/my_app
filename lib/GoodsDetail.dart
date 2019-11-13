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
      "title": "红色",
      "type": 0,
    },
    {"title": "白色", "type": 1},
    {"title": "橙色", "type": 2},
    {"title": "黄色", "type": 3},
    {"title": "绿色", "type": 4},
    {"title": "青色", "type": 5},
    {"title": "蓝色", "type": 6},
    {"title": "紫色", "type": 7},
    {"title": "红白色", "type": 8},
    {"title": "天蓝色", "type": 9},
    {"title": "蓝紫色", "type": 10},
  ];
  final List sizeList=[
    {'SizeID':'OOA','Size':'35','stockQty':'35','Qty':'35'},
    {'SizeID':'OOB','Size':'36','stockQty':'36','Qty':'36'},
    {'SizeID':'OOC','Size':'37','stockQty':'37','Qty':'37'},
    {'SizeID':'OOD','Size':'38','stockQty':'38','Qty':'38'},
    {'SizeID':'OOE','Size':'39','stockQty':'39','Qty':'39'},
    {'SizeID':'OOE','Size':'40','stockQty':'40','Qty':'40'},
    {'SizeID':'OOE','Size':'41','stockQty':'41','Qty':'41'},
    {'SizeID':'OOE','Size':'42','stockQty':'42','Qty':'42'},
    {'SizeID':'OOE','Size':'43','stockQty':'43','Qty':'43'},
    {'SizeID':'OOE','Size':'44','stockQty':'44','Qty':'44'}
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


  Widget size(BuildContext context,ls,index,sizemap){
    //flutter中访问 map的属性用 sizemap['xxx'] 方式与js不同sizemap.xxx
    print('sizemap的值:'+sizemap.toString());

  //   var keylist= sizemap.keys.toList(); //得到sizemap的下标

    var textEditingControllers = <TextEditingController>[];
    var listTF = <TextField>[];
    //添加  controllers
      for(var i=0;i<ls.length;i++){
        print('第个i:'+ls[i].toString());
        TextEditingController controller =new TextEditingController(text: ls[i]['Qty']);
      var tf= TextField(
             textAlign: TextAlign.center,
             controller: controller,//sizemap.key 获取键位看看行不行
            keyboardType: TextInputType.number,
            decoration: (const InputDecoration(

              border: OutlineInputBorder(
                borderSide:
                BorderSide(width: 1.0, color: Colors.black12),
              ),
              contentPadding:
              const EdgeInsets.symmetric(vertical: 4.0),
            ))
      );
        listTF.add(tf);
      //  textEditingControllers.add(i,controller);
      }





    return  Container(
      width: double.infinity,
      alignment: Alignment(0, 0),
      decoration: BoxDecoration(
          border:
          Border(bottom: BorderSide(width: 1.0, color: Colors.black12))),
      child: Row(
        children: <Widget>[
          Container(
            width: 80.0,
            alignment: Alignment(0, 0),
            child: Text(sizemap['Size']),
          ),
          Container(
            width: 100.0,
            alignment: Alignment(0, 0),
            child: Text(sizemap['stockQty']+'/'+sizemap['Qty']),
          ),
          Expanded(
            child: Container(
              // color: Colors.amber,
              height: 35.0,
              alignment: Alignment.center,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.remove_circle_outline,
                    size: 35.0,
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 35.0,
                      maxWidth: 35.0,
                    ),
                    child: listTF[index],
                  ),
                  Icon(Icons.add_circle, size: 35.0)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget layout(BuildContext context) {
    //------------------------------
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
      Container(
         child:
            Expanded(
              flex: 1,
              child: ListView(
           // shrinkWrap: true,
          //  physics: NeverScrollableScrollPhysics(), //f拿到的就是下标
            children: widget.sizeList.asMap().keys.map((f){
              return size(context,widget.sizeList,f,widget.sizeList[f]);
            }).toList(),
             )
            ),
      ),
      Container(
          child: Align(
              //对齐底部
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 40.0,
                //key: _keyRed,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      top: BorderSide(width: 1.0, color: Colors.black12)),
                ),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Text(
                          '合计',
                          style: TextStyle(color: hexToColor('#696969')),
                        ),
                      ),
                      Container(
                        //  margin: EdgeInsets.only(left: 30.0),
                        child: Text('333',
                            style: TextStyle(color: hexToColor('#696969'))),
                      ),
                      Container(
                        //    margin: EdgeInsets.only(left: 30.0),
                        child: Text('3330.00',
                            style: TextStyle(color: hexToColor('#696969'))),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 40.0,
                        width: 100.0,
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          //  borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Text(
                          '确定',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ]),
                //  ),
              )))
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
        body:
          Container(
            decoration: BoxDecoration(color: Colors.white),

              child:Column(children: layout1 //<Widget>[]  Column 抽出来单独写
                ),
          ),

        //  resizeToAvoidBottomInset:false
          // resizeToAvoidBottomPadding:false
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
