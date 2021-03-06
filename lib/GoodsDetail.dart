


import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_app/utils/bottom_sheet.dart';
import 'package:color_dart/color_dart.dart';
class Goods {
  final String GoodsID = "";
  final String Code = "";
  final String Name = "";
  final double RetailSales = 0.0;
}

class GoodsDetail extends StatefulWidget  {
  final Goods goods;

//list List
  List formList = [
    {'GoodsID':'OOAC','ColorID':'00A',"title": "红色","type": 0,'tipqty':1},
    {'GoodsID':'OOAC','ColorID':'00B',"title": "白色", "type": 1,'tipqty':2},
    {'GoodsID':'OOAC','ColorID':'00C',"title": "橙色", "type": 2,'tipqty':0},
    {'GoodsID':'OOAC','ColorID':'00D',"title": "黄色", "type": 3,'tipqty':0},
    {'GoodsID':'OOAC','ColorID':'00E',"title": "绿色", "type": 4,'tipqty':0},
    {'GoodsID':'OOAC','ColorID':'00F',"title": "青色", "type": 5,'tipqty':0},
    {'GoodsID':'OOAC','ColorID':'00G',"title": "蓝色", "type": 6,'tipqty':0},
    {'GoodsID':'OOAC','ColorID':'00H',"title": "紫色", "type": 7,'tipqty':0},
    {'GoodsID':'OOAC','ColorID':'00I',"title": "红白色", "type": 8,'tipqty':0},
    {'GoodsID':'OOAC','ColorID':'00J',"title": "天蓝色", "type": 9,'tipqty':0},
    {'GoodsID':'OOAC','ColorID':'00K',"title": "蓝紫色", "type": 10,'tipqty':0},
  ];

  //List
  List sizeList = [
    {'GoodsID':'OOAC','ColorID':'00A','SizeID': 'OOA', 'Size': '35', 'stockQty': '35', 'Qty': 35},
    {'GoodsID':'OOAC','ColorID':'00A','SizeID': 'OOB', 'Size': '36', 'stockQty': '36', 'Qty': 36},
    {'GoodsID':'OOAC','ColorID':'00B','SizeID': 'OOC', 'Size': '37', 'stockQty': '37', 'Qty': 37},
    {'GoodsID':'OOAC','ColorID':'00B','SizeID': 'OOD', 'Size': '38', 'stockQty': '38', 'Qty': 38},
    {'GoodsID':'OOAC','ColorID':'00C','SizeID': 'OOE', 'Size': '39', 'stockQty': '39', 'Qty': 39},
    {'GoodsID':'OOAC','ColorID':'00C','SizeID': 'OOE', 'Size': '40', 'stockQty': '40', 'Qty': 40},
    {'GoodsID':'OOAC','ColorID':'00D','SizeID': 'OOE', 'Size': '41', 'stockQty': '41', 'Qty': 41},
    {'GoodsID':'OOAC','ColorID':'00E','SizeID': 'OOE', 'Size': '42', 'stockQty': '42', 'Qty': 42},
    {'GoodsID':'OOAC','ColorID':'00F','SizeID': 'OOE', 'Size': '43', 'stockQty': '43', 'Qty': 43},
    {'GoodsID':'OOAC','ColorID':'00G','SizeID': 'OOE', 'Size': '44', 'stockQty': '44', 'Qty': 44}
  ];

  GoodsDetail({Key key, this.goods}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    print('进入的aaaaaaaa');
    return GoodsDetailState();
  }
}

class GoodsDetailState extends State<GoodsDetail> with AutomaticKeepAliveClientMixin{

  @override
  bool get wantKeepAlive=>true;

  List listt = []; //接收尺码列表变量的 总的数量
  List choseList=[];
  List colorList = []; //接收颜色列表变量
  int groupValue = 0; //这里表示显示当前第几条数据
  var textEditingControllers = <TextEditingController>[];
  var listTF = <TextField>[];
  List<Widget> slist = []; //存储尺码列表控件

  //添加  controllers


  @override
  void initState() {
    super.initState();
    listt = widget.sizeList; //接收
    colorList = widget.formList;

    if(listt.length>0){
     var datas= listt.where((item)=>item['ColorID']==colorList[groupValue]['ColorID']);
     choseList =datas.toList();
    }

    updateWidget();//更新界面

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return layout(context);
  }

  Widget size(index, sizemap) {
    //flutter中访问 map的属性用 sizemap['xxx'] 方式与js不同sizemap.xxx
    print('sizemap的值:' + sizemap.toString());
    //   var keylist= sizemap.keys.toList(); //得到sizemap的下
    return Container(
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
            child: Text(sizemap['stockQty'].toString() +
                '/' +
                sizemap['Qty'].toString()),
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
                  GestureDetector(
                    onTap: () {
                      QtyCheck(listTF[index].controller.text, index, 'jian');
                    },
                    child: Icon(
                      Icons.remove_circle_outline,
                      size: 35.0,
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 35.0,
                      maxWidth: 50.0,
                    ),
                    child: listTF[index],
                  ),
                  GestureDetector(
                    onTap: () {
                      QtyCheck(listTF[index].controller.text, index, 'add');
                    },
                    child: Icon(Icons.add_circle, size: 35.0),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }




  void updateGroupValue(int v) {
    setState(() {
      groupValue = v;
      var testWhere = listt.where((item)=>item['ColorID']==colorList[groupValue]['ColorID']);
      print('testWhere数据：${testWhere}');
      print('testWhere数据：${testWhere.length}');
      choseList =testWhere.toList();//(jsonDecode(testWhere.toString()) as List).cast();
      print('choseList数据：${choseList}');
      updateWidget();
    });
  }

  void updateWidget(){
    //重新添加组件
    slist.clear();
    for (var i = 0; i < choseList.length; i++) {
      print('第个i:' + choseList[i].toString());
      TextEditingController controller =
      TextEditingController.fromValue(TextEditingValue(
        text: (choseList[i]['Qty']).toString(),
        // 保持光标在最后
        selection: TextSelection.fromPosition(TextPosition(
            affinity: TextAffinity.downstream,
            offset: (choseList[i]['Qty']).toString().length)),
      ));

      var tf = TextField(
          textAlign: TextAlign.center,
          controller: controller,
          //sizemap.key 获取键位看看行不行
          keyboardType: TextInputType.number,
          textDirection: TextDirection.ltr,
          onChanged: (val) {
            print('进入方法了');
            txtChanged(val, i);
          },
          decoration: (const InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 1.0, color: Colors.black12),
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 4.0),
          )));
      listTF.add(tf);
      //  textEditingControllers.add(i,controller);

      slist.add(size(i, choseList[i]));
    }
  }

  Widget listitem(context, index,value) {
    var deviceSize = MediaQuery.of(context).size;
    print(value['type']);
    print('提示数量：${value['tipqty']}');
    return groupValue == index
        ? Stack(
          children: <Widget>[

            RaisedButton(
              color: Colors.orange, //Colors.black,
              onPressed: () {
                print('切换${value}');
                updateGroupValue(index);
              },
              child: Text(
                value['title'],
                style: TextStyle(color: Colors.white),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: (value['tipqty'] !=0 && value['tipqty'] !=null) ?
                Container(width: 20.0,height: 20,alignment: Alignment.center,
                decoration: BoxDecoration(color: Colors.red,border: Border.all(width: 1.0,color: Colors.red),
                borderRadius: BorderRadius.all(Radius.circular(10.0))), child:Text('${value['tipqty']}',style
                : TextStyle(color: Colors.white,fontSize: 8.0),) ,):Text(''),
            ),
          ],

        )
        : Stack(
           children: <Widget>[
             OutlineButton(
               onPressed: () {
                 print('切换${value}');
                 updateGroupValue(index);
               },
               child: Text(value['title'], overflow: TextOverflow.ellipsis),
             ),
             Positioned(
               right: 0,
               top: 0,
               child: (value['tipqty'] !=0 && value['tipqty'] !=null) ?
               Container(width: 20.0,height: 20,alignment: Alignment.center,
                 decoration: BoxDecoration(color: Colors.red,border: Border.all(width: 1.0,color: Colors.red),
                     borderRadius: BorderRadius.all(Radius.circular(10.0))), child:Text('${value['tipqty']}',style
                     : TextStyle(color: Colors.white,fontSize: 8.0),) ,):Text(''),
             ),
           ],
          );

  } //这里是代码的关键比较 当value和groupValue一致的时候则选中 设置选中样式和没选中样式

  TextEditingController discountRate = TextEditingController(text: '9.0');
  TextEditingController uniPrice = TextEditingController(text: '299.00');

  Widget layout(BuildContext context) {
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
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: 20.0,
                            maxWidth: 80.0,
                          ),
                          child: TextField(
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              controller: discountRate,
                              decoration: (const InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 4.0),
                              ))),
                        ),
                        Text(
                          '单价:',
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: 20.0,
                            maxWidth: 100.0,
                          ),
                          child: TextField(
                              textAlign: TextAlign.center,
                              controller: uniPrice,
                              keyboardType: TextInputType.number,
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
          children: colorList.asMap().keys.map((index){
            return listitem(context, index,colorList[index]);
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
          //  child:
          // Expanded(

          child: Column(children: slist // widget.sizeList.asMap().keys.map((f){
              //  print('widget中的：'+widget.sizeList.toString());
              //   return size(context,f,widget.sizeList[f]);
              //   }).toList(),
              )

          //  ),
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
    //pop 菜单
    List popMenulist=[
      {'value':'search','text':'查询'},
      {'value':'print1','text':'打印'},
      {'value':'more','text':'更多'},
    ];

    String _bodyStr = "显示菜单内容";
    return  WillPopScope(
        child:
        Scaffold(
      appBar: PreferredSize(
          child: AppBar(
              title: Text('货品详情'),
              centerTitle: true,
              backgroundColor: hexToColor('#108ee9'),
              automaticallyImplyLeading: true,
              actions: <Widget>[

                new PopupMenuButton(
                     offset: Offset(0.0,40.0),
                     color: hex('#fff'),
                    onSelected: (String value){
                      setState(() {
                        _bodyStr = value;
                      });
                      print(_bodyStr);
                    },
                    itemBuilder: (BuildContext context) =><PopupMenuItem<String>>[
                      new PopupMenuItem(
                          value:"print",
                          child:Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Icon(Icons.print),
                              Text("打印",style: TextStyle(fontSize: 14.0),)
                            ],
                          )
                      ),
                      new PopupMenuItem(
                          value: "more",
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Icon(Icons.more),
                              Text("更多",style: TextStyle(fontSize: 14.0))
                            ],
                          )
                      )
                    ]
                ),
                /*
               Builder(builder:(context)=>IconButton(
                 icon: Icon(Icons.more_vert),
                 onPressed: (){

                /*   BottomActionSheet.show(context, ['微信','支付宝','生成收款二维码','线下转账'],title: '请选择支付方式',callBack:(i) {
                     print('click $i');
                     Navigator.pop(context);
                     return;
                   });
                     */
                 /*  Scaffold.of(context).showBottomSheet((BuildContext context){
                     return Row(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: <Widget>[
                         IconButton(icon: Icon(Icons.shop_two), onPressed: (){
                           Navigator.pop(context);
                         }),
                         IconButton(icon: Icon(Icons.shop_two), onPressed: (){
                           Navigator.pop(context);
                         })
                       ],);
                   }); */
                 },
               )
               ), */

              ],
           ),
          preferredSize: Size.fromHeight(40.0)),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: SingleChildScrollView(
            child: Container(
          //    margin: EdgeInsets.only(bottom: 40.0),
          child: Column(
            children: layout1,
          ), //<Widget>[]  Column 抽出来单独写),
        )),
      ),
      //  persistentFooterButtons:<Widget>[
      bottomNavigationBar: Container(
        height: 40.0,
        //key: _keyRed,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(width: 1.0, color: Colors.black12)),
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
                child:
                    Text('333', style: TextStyle(color: hexToColor('#696969'))),
              ),
              Container(
                //    margin: EdgeInsets.only(left: 30.0),
                child: Text('3330.00',
                    style: TextStyle(color: hexToColor('#696969'))),
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  submit(context);
                },
                child: Container(
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
              )
            ]),
      ),

      // ],

      // resizeToAvoidBottomInset:false
      // resizeToAvoidBottomPadding:false
    ),
      onWillPop: _requestPop,
     );
  }

  void QtyCheck(String Qty, int i, String Type) {
    print('Qty的值：${Qty}');
    print('i的值：${i}');
    if (int.parse(Qty) > 0) {
      setState(() {
      if (Type == 'jian') {
          listt[i]['Qty'] = listt[i]['Qty'] - 1;

      } else if (Type == 'add') {
          listt[i]['Qty'] = listt[i]['Qty'] + 1;
      }
      //最后合计
      int totalQty=0;
      listt.forEach((v){

        if(v['GoodsID']==colorList[groupValue]['GoodsID'] && v['ColorID']==colorList[groupValue]['ColorID']){
          totalQty =totalQty+v['Qty'];
        }

      });

      colorList[groupValue]['tipqty']=totalQty;

      });
      listTF[i].controller.text = listt[i]['Qty'].toString();
      print('sizeList的变化:${listt.toString()}');
      print('aa的值：${listt[i]['Qty']}');
      listTF[i].controller.text = listt[i]['Qty'].toString();
    }
  }

  void txtChanged(String val, int i) {
    print('val的值：${val}');
    print('i的值：${i}');
    if (int.parse(val) != 0) {
      setState(() {
        listt[i]['Qty'] = int.parse(val);
      });
      listTF[i].controller.text = listt[i]['Qty'].toString();
    }
  }

//提交数据 返回到界面
  void submit(BuildContext context) {
    print('提交的list:${listt.toString()}');
    toast("点击了按扭");
  }
} //state界面结束

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
