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



//list List
  List   formList = [
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
 //List
  List   sizeList=[
    {'SizeID':'OOA','Size':'35','stockQty':'35','Qty':35},
    {'SizeID':'OOB','Size':'36','stockQty':'36','Qty':36},
    {'SizeID':'OOC','Size':'37','stockQty':'37','Qty':37},
    {'SizeID':'OOD','Size':'38','stockQty':'38','Qty':38},
    {'SizeID':'OOE','Size':'39','stockQty':'39','Qty':39},
    {'SizeID':'OOE','Size':'40','stockQty':'40','Qty':40},
    {'SizeID':'OOE','Size':'41','stockQty':'41','Qty':41},
    {'SizeID':'OOE','Size':'42','stockQty':'42','Qty':42},
    {'SizeID':'OOE','Size':'43','stockQty':'43','Qty':43},
    {'SizeID':'OOE','Size':'44','stockQty':'44','Qty':44}
    ];

  GoodsDetail({Key key, this.goods}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
     print('进入的aaaaaaaa');
    return GoodsDetailState();
  }
}

class GoodsDetailState extends State<GoodsDetail> {

  List listt=[];

  var textEditingControllers = <TextEditingController>[];
  var listTF = <TextField>[];
   List<Widget> slist=[];
  //添加  controllers




  @override
  void initState() {
    // TODO: implement initState
    listt=widget.sizeList;
  for(var i=0;i<listt.length;i++)
  {
    print('第个i:'+listt[i].toString());
  TextEditingController controller =TextEditingController.fromValue(TextEditingValue(
      text:(listt[i]['Qty']).toString(),
      // 保持光标在最后
      selection: TextSelection.fromPosition(TextPosition(
          affinity: TextAffinity.downstream,
          offset: (listt[i]['Qty']).toString().length)),
   ));

  var  tf= TextField(
  textAlign: TextAlign.center,
  controller: controller,//sizemap.key 获取键位看看行不行
  keyboardType: TextInputType.number,
  textDirection: TextDirection.ltr,

  onChanged: (val){
    print('进入方法了');
    txtChanged(val,i);
  },
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


    slist.add(size(i,listt[i]));


  }
  //



  super.initState();
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

  Widget size(index,sizemap){
    //flutter中访问 map的属性用 sizemap['xxx'] 方式与js不同sizemap.xxx
    print('sizemap的值:'+sizemap.toString());
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
            child: Text(sizemap['stockQty'].toString()+'/'+sizemap['Qty'].toString()),
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
                    onTap: (){
                      QtyCheck(listTF[index].controller.text,index,'jian');
                    },
                    child:Icon(
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
                    onTap: (){
                      QtyCheck(listTF[index].controller.text,index,'add');
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




  TextEditingController discountRate = TextEditingController(text:'9.0');
  TextEditingController uniPrice = TextEditingController(text:'299.00');

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
              child:
              Column(
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
       //  child:
           // Expanded(

               child: Column(
                 children:slist// widget.sizeList.asMap().keys.map((f){
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

    return// WillPopScope(
      //child:
        Scaffold(
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
                 child:
                 SingleChildScrollView(
                     child:
                      Container(
                    //    margin: EdgeInsets.only(bottom: 40.0),
                        child:
                         Column(
                           children: layout1,
                            ),//<Widget>[]  Column 抽出来单独写),
                      )
                  ),

               ),
        //  persistentFooterButtons:<Widget>[
        bottomNavigationBar:
        Container(
          height: 40.0,
          //key: _keyRed,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                top: BorderSide(width: 1.0, color: Colors.black12)),
          ),
          child:
             Row(
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
                   GestureDetector(
                     behavior:HitTestBehavior.opaque,
                      onTap:() {
                       submit(context);
                      },
                      child:   Container(
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
      );
    //  onWillPop: _requestPop,
   // );
  }


  void QtyCheck(String Qty, int i,String Type){
    print('Qty的值：${Qty}');
    print('i的值：${i}');
    if(int.parse(Qty)>0){
      if(Type=='jian') {
        setState(() {
          listt[i]['Qty'] = listt[i]['Qty'] - 1;
        });
      }else if(Type=='add'){
        setState(() {
          listt[i]['Qty'] = listt[i]['Qty'] + 1;
        });
      }
      listTF[i].controller.text=listt[i]['Qty'].toString();
      print('sizeList的变化:${listt.toString()}');
      print('aa的值：${listt[i]['Qty']}');
      listTF[i].controller.text=listt[i]['Qty'].toString();
    }
  }
  void txtChanged(String val,int i){
    print('val的值：${val}');
    print('i的值：${i}');
    if(int.parse(val) !=0){
      setState(() {
        listt[i]['Qty']=int.parse(val);
      });
      listTF[i].controller.text=listt[i]['Qty'].toString();

    }

  }


//提交数据 返回到界面
  void submit(BuildContext context){
    print('提交的list:${listt.toString()}');
    toast("点击了按扭");
  }




}  //state界面结束





void toast(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIos: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white
  );
}
//十六进制颜色值格式一般如：#ff0000，以#开头，后面跟着6个十六进制字符。
//而flutter中不能直接使用此类形式的颜色值，所以必须要转换为flutter颜色对象。
Color hexToColor(String s) {
  // 如果传入的十六进制颜色值不符合要求，返回默认值
  if (s == null || s.length != 7 || int.tryParse(s.substring(1, 7), radix: 16) == null) {
    s = '#999999';
  }

  return new Color(int.parse(s.substring(1, 7), radix: 16) + 0xFF000000);
}