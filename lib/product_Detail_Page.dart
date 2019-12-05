import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flustars/flustars.dart';
import './component/adjustable_bottomsheet.dart';
import 'package:provider/provider.dart';
import './provider/ColorListProvider.dart';
//使用静态组件
class ProductDetailPage extends StatelessWidget {
  List colorList = [
    {
      'GoodsID': 'OOAC',
      'ColorID': '00A',
      "title": "红色",
      "type": 0,
      'tipqty': 1
    },
    {
      'GoodsID': 'OOAC',
      'ColorID': '00B',
      "title": "白色",
      "type": 1,
      'tipqty': 2
    },
    {
      'GoodsID': 'OOAC',
      'ColorID': '00C',
      "title": "橙色",
      "type": 2,
      'tipqty': 0
    },
    /*  {'GoodsID':'OOAC','ColorID':'00D',"title": "黄色", "type": 3,'tipqty':0},
    {'GoodsID':'OOAC','ColorID':'00E',"title": "绿色", "type": 4,'tipqty':0},
    {'GoodsID':'OOAC','ColorID':'00F',"title": "青色", "type": 5,'tipqty':0},
    {'GoodsID':'OOAC','ColorID':'00G',"title": "蓝色", "type": 6,'tipqty':0},
    {'GoodsID':'OOAC','ColorID':'00H',"title": "紫色", "type": 7,'tipqty':0},
    {'GoodsID':'OOAC','ColorID':'00I',"title": "红白色", "type": 8,'tipqty':0},
    {'GoodsID':'OOAC','ColorID':'00J',"title": "天蓝色", "type": 9,'tipqty':0},
    {'GoodsID':'OOAC','ColorID':'00K',"title": "蓝紫色", "type": 10,'tipqty':0},*/
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

  List<TextEditingController> sizeTxt=[];

  List choseSizeList=[];

  int selectIndex=0;

  @override
  Widget build(BuildContext context) {
   //  Provider.of<ColorListProvider>(context).SetColorList(colorList, selectIndex, sizeList);
    // choseSizeList =Provider.of<ColorListProvider>(context).choseSizeList;


    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          title: Text(
            '详情展示',
            style: TextStyle(fontSize: 18.0),
          ),
          centerTitle: true,
        ),
        preferredSize: Size.fromHeight(40.0),
      ),
      body: _body(context), //主休显示
      bottomNavigationBar: _bottombar(context),
    );
  }

  Widget _body(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        //  height: ScreenUtil.getInstance().screenHeight,
        //   width: ScreenUtil.getInstance().screenWidth,
        color: Color.fromRGBO(236, 236, 236, 1.0),
        child: Column(
          children: <Widget>[
            _swiper(context),
            _getGoodsName(),
            _openVip(),
          ],
        ),
      ),
    );
  }

  //轮播图
  Widget _swiper(BuildContext context) {
    return Container(
      width: ScreenUtil.getInstance().screenWidth,
      height: 300.0,
      child: Swiper.children(
        containerWidth: ScreenUtil.getInstance().screenWidth,
        autoplay: true,
        pagination: new SwiperPagination(
            margin: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
            builder: new DotSwiperPaginationBuilder(
                color: Colors.white30,
                activeColor: Colors.white,
                size: 5.0,
                activeSize: 5.0)),
        children: <Widget>[
          new Image.asset(
            "images/1.JPG",
            fit: BoxFit.fitWidth, //BoxFit.contain,
            width: ScreenUtil.getInstance().screenWidth,
          ),
          new Image.asset(
            "images/2.JPG",
            fit: BoxFit.fitWidth,
            width: ScreenUtil.getInstance().screenWidth,
          ),
          new Image.asset(
            "images/3.JPG",
            fit: BoxFit.fitWidth,
            width: ScreenUtil.getInstance().screenWidth,
          )
        ],
      ),
    );
  }

  //Vip 价格 名称，点赞
  Widget _getGoodsName() {
    return Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 10.0, left: 10.0),
                  alignment: Alignment.center,
                  width: 80.0,
                  height: 20.0,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.0,
                      color: Colors.redAccent,
                    ),
                    color: Colors.redAccent,
                  ),
                  child: Text(
                    '商城会员',
                    style: TextStyle(fontSize: 13.0, color: Colors.white),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.0, left: 5.0),
                  child: Text('￥150.00', style: TextStyle(fontSize: 16.0)),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 10.0),
                  alignment: Alignment.centerLeft,
                  height: 40.0,
                  child: Text(
                    '9LA119M310',
                    style: TextStyle(fontSize: 15.0, color: Colors.black26),
                  ),
                ),
                Container(
                  height: 40.0,
                  padding: EdgeInsets.only(right: 10.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.favorite_border,
                        color: Colors.black26,
                      ),
                      Text(
                        '453',
                        style: TextStyle(
                          color: Colors.black26,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 10.0),
                  child: Text('宣衣社 | 灯心绒撞色棉衣'),
                ),
              ],
            ),
          ],
        ));
  }

  Widget _openVip() {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        children: <Widget>[
          Container(
            height: 40.0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 10.0),
                  child: Text(
                    '价格',
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10.0),
                  child: Text(
                    '开通会员',
                    style: TextStyle(color: Colors.lightBlue),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottombar(BuildContext context) {
    return Container(
      height: 60.0,
      //  padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            height: 45.0,
            width: 45.0,
            padding: EdgeInsets.only(top: 5.0),
            //  margin: EdgeInsets.only(left: 5.0),
            child: Column(
              children: <Widget>[
                Icon(Icons.home, size: 25.0, color: Colors.black26),
                Text(
                  '首页',
                  style: TextStyle(fontSize: 10.0, color: Colors.black26),
                )
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 5.0),
            height: 45.0,
            width: 45.0,
            //  margin: EdgeInsets.only(left: 5.0),
            child: Column(
              children: <Widget>[
                Icon(Icons.headset_mic, size: 25.0, color: Colors.black26),
                Text(
                  '客服',
                  style: TextStyle(fontSize: 10.0, color: Colors.black26),
                )
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 5.0),
            height: 45.0,
            width: 45.0,
            //  margin: EdgeInsets.only(left: 5.0),
            child: Column(
              children: <Widget>[
                Icon(Icons.favorite_border, size: 25.0, color: Colors.black26),
                Text(
                  '收藏',
                  style: TextStyle(fontSize: 10.0, color: Colors.black26),
                )
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 5.0),
            height: 45.0,
            width: 80.0,
            decoration: BoxDecoration(
              border: Border.all(
                  width: 1.0, color: Color.fromRGBO(236, 236, 236, 1.0)),
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
            //  margin: EdgeInsets.only(left: 5.0),
            child: Column(
              children: <Widget>[
                Icon(Icons.shopping_cart, size: 25.0, color: Colors.black26),
                // Text('收藏',style: TextStyle(fontSize: 10.0,color: Colors.black26),)
              ],
            ),
          ),
          InkWell(
            onTap: () {

              choseSizeList =sizeList.where((item)=>item['ColorID']==colorList[groupValue]['ColorID']).toList();
               if(sizeTxt.length>0) sizeTxt.clear();
              for(int i=0;i<choseSizeList.length;i++){
                TextEditingController controller =new TextEditingController();
                controller.text ='${choseSizeList[i]['Qty']}';
                sizeTxt.add(controller);
              }

              showAdjustableBottomSheet(
                  //showModalBottomSheet showAdjustableBottomSheet
                  isScrollControlled: false,
                  useRootNavigator: false,
                  context: context,
                  builder: (BuildContext context) {
                    return StatefulBuilder(
                        builder:(context1, state) {
                          ///这里的state就是setState

                         return    AnimatedPadding(
                           //SingleChildScrollView
                           padding: MediaQuery.of(context).viewInsets,
                           duration: const Duration(milliseconds: 50),
                           child: SingleChildScrollView(
                             child: Column(
                               children: <Widget>[
                                 Container(
                                   height:
                                   ScreenUtil.getInstance().screenHeight - 200,

                                   padding: EdgeInsets.only(top: 10.0, left: 10.0),
                                   color: Colors.white,
                                   //Color.fromRGBO(114, 114, 114, 1),
                                   child: Column(
                                     mainAxisSize: MainAxisSize.max,
                                     //MainAxisSize.min,
                                     children: <Widget>[
                                       Container(
                                         child: Row(
                                           crossAxisAlignment:
                                           CrossAxisAlignment.center,
                                           mainAxisAlignment:
                                           MainAxisAlignment.start,
                                           children: <Widget>[
                                             Container(
                                               width: 120.0,
                                               height: 120.0,
                                               child: Image.asset("images/1.JPG"),
                                             ),
                                             Container(
                                               height: 120.0,
                                               //  padding: EdgeInsets.only(left: 10.0),
                                               child: Column(
                                                 crossAxisAlignment:
                                                 CrossAxisAlignment.start,
                                                 mainAxisAlignment:
                                                 MainAxisAlignment.end,
                                                 children: <Widget>[
                                                   Container(
                                                     height: 30.0,
                                                     child: Text('￥133.00'),
                                                   ),
                                                   Container(
                                                     height: 30.0,
                                                     child: Text('库存:10'),
                                                   ),
                                                   Container(
                                                     height: 30.0,
                                                     child: Text('已选:10'),
                                                   ),
                                                 ],
                                               ),
                                             )
                                           ],
                                         ),
                                       ),
                                       Container(
                                         padding: EdgeInsets.only(
                                             top: 10.0, bottom: 10.0),
                                         alignment: Alignment.centerLeft,
                                         height: 40.0,
                                         child: Text('颜色'),
                                       ),
                                       Container(
                                           margin: EdgeInsets.only(bottom: 10.0),
                                           height: (colorList.length / 5 * 80.0),
                                           decoration: BoxDecoration(
                                               border: Border(
                                                   bottom: BorderSide(
                                                       width: 1.0,
                                                       color: Colors.black12))),
                                           child: GridView.count(
                                             // padding: EdgeInsets.only(bottom:10.0),
                                             //一行多少个

                                             crossAxisCount: 5,
                                             //滚动方向
                                             scrollDirection: Axis.vertical,
                                             // 左右间隔
                                             crossAxisSpacing: 5.0,
                                             // 上下间隔
                                             mainAxisSpacing: 3.0,
                                             //宽高比
                                             childAspectRatio: 1 / 0.6,
                                             physics: NeverScrollableScrollPhysics(),
                                             children:
                                             colorList.asMap().keys.map((index) {
                                               return listitem(
                                                   context, index, colorList[index],state);
                                             }).toList(),
                                           )

                                         //  ),
                                       ),
                                       Expanded(
                                         child: ListView.builder(
                                           // physics: const NeverScrollableScrollPhysics(),
                                           itemCount: choseSizeList.length,
                                           itemBuilder: (context, index) {
                                             return ListTile(
                                               title: Container(
                                                   alignment: Alignment.centerLeft,
                                                   height: 50.0,
                                                   decoration: BoxDecoration(
                                                       border: Border(
                                                           bottom: BorderSide(
                                                               width: 1.0,
                                                               color:
                                                               Colors.black12))),
                                                   child: Row(
                                                     crossAxisAlignment:
                                                     CrossAxisAlignment.center,
                                                     mainAxisAlignment:
                                                     MainAxisAlignment
                                                         .spaceBetween,
                                                     children: <Widget>[
                                                       Container(
                                                         child: Text('${choseSizeList[index]['Size']}'),
                                                       ),
                                                       Container(
                                                         padding: EdgeInsets.only(
                                                             right: 10.0),
                                                         child: Row(
                                                           children: <Widget>[
                                                             Container(
                                                               child: Text(
                                                                 '库存:${choseSizeList[index]['stockQty']}',
                                                                 style: TextStyle(
                                                                     color: Colors
                                                                         .black12),
                                                               ),
                                                             ),
                                                             InkWell(
                                                               onTap: (){
                                                                 updateQty(state,index,int.parse(sizeTxt[index].text),'jian');
                                                               },
                                                               child:    Container(
                                                                 margin:
                                                                 EdgeInsets.only(
                                                                     left: 10.0),
                                                                 alignment:
                                                                 Alignment.center,
                                                                 height: 30.0,
                                                                 width: 30.0,
                                                                 decoration:
                                                                 BoxDecoration(
                                                                   border: Border.all(
                                                                       width: 1.0,
                                                                       color: Colors
                                                                           .black12),
                                                                   color:
                                                                   Color.fromRGBO(
                                                                       236,
                                                                       236,
                                                                       236,
                                                                       1.0),
                                                                 ),
                                                                 child: Text(
                                                                   '—',
                                                                   style: TextStyle(
                                                                       color: Colors
                                                                           .black12),
                                                                 ),
                                                               ),
                                                             ),

                                                             Container(
                                                               width: 30.0,
                                                               height: 30.0,
                                                               decoration:
                                                               BoxDecoration(
                                                                 border: Border.all(
                                                                     width: 1.0,
                                                                     color: Colors
                                                                         .black12),
                                                               ),
                                                               child: ConstrainedBox(
                                                                 constraints:
                                                                 BoxConstraints(
                                                                   maxWidth: 30.0,
                                                                   maxHeight: 30.0,
                                                                 ),
                                                                 child: TextField(
                                                                   onChanged: (v){
                                                                     if(int.parse(v) is int && int.parse(v)<=int.parse(choseSizeList[index]['stockQty'])){
                                                                       print(v);
                                                                       state((){
                                                                         choseSizeList[index]['Qty'] =int.parse(v);
                                                                         int tipqty=0;
                                                                         sizeList.forEach((v){
                                                                           if(v['GoodsID']==choseSizeList[index]['GoodsID'] && v['ColorID']==choseSizeList[index]['ColorID'] && v['SizeID']==choseSizeList[index]['SizeID']){
                                                                             v['Qty'] =choseSizeList[index]['Qty'];
                                                                           }
                                                                           if(colorList[groupValue]['ColorID']== v['ColorID']){
                                                                             tipqty =tipqty+v['Qty'];
                                                                           }
                                                                          //提示数量
                                                                         });
                                                                         colorList[groupValue]['tipqty'] =tipqty;
                                                                         print('sizeList的最终值：${sizeList}');
                                                                       });

                                                                     }
                                                                   },
                                                                   controller: sizeTxt[index],
                                                                   keyboardType:TextInputType.number,
                                                                   decoration:
                                                                   InputDecoration(
                                                                     contentPadding:
                                                                     EdgeInsets.symmetric(
                                                                         vertical:
                                                                         4.0),
                                                                     border: OutlineInputBorder(
                                                                         borderSide:
                                                                         BorderSide
                                                                             .none),
                                                                   ),
                                                                 ),
                                                               ),
                                                             ),
                                                             InkWell(
                                                               onTap: (){
                                                                 updateQty(state,index,int.parse(sizeTxt[index].text),'add');
                                                               },
                                                               child:  Container(
                                                                 alignment:
                                                                 Alignment.center,
                                                                 height: 30.0,
                                                                 width: 30.0,
                                                                 decoration:
                                                                 BoxDecoration(
                                                                   border: Border.all(
                                                                       width: 1.0,
                                                                       color: Colors
                                                                           .black12),
                                                                   color:
                                                                   Color.fromRGBO(
                                                                       236,
                                                                       236,
                                                                       236,
                                                                       1.0),
                                                                 ),
                                                                 child: Text('+'),
                                                               ) ,
                                                             ),

                                                           ],
                                                         ),
                                                       ),
                                                     ],
                                                   )),
                                             );
                                           },
                                         ),
                                       ),
                                     ],
                                   ),
                                 ),
                                 Align(
                                   alignment: Alignment.bottomLeft,
                                   child: Container(
                                     height: 90.0,
                                     decoration: BoxDecoration(
                                       // border: Border.all(width:1.0),
                                       color: Colors.white,
                                     ),
                                     child: Column(
                                       crossAxisAlignment: CrossAxisAlignment.end,
                                       mainAxisAlignment: MainAxisAlignment.end,
                                       children: <Widget>[
                                         Container(
                                           height: 40.0,
                                           decoration: BoxDecoration(
                                             // border: Border.all(width:1.0),
                                             color: Colors.white,
                                           ),
                                           child: Row(
                                             crossAxisAlignment:
                                             CrossAxisAlignment.center,
                                             mainAxisAlignment:
                                             MainAxisAlignment.end,
                                             children: <Widget>[
                                               Container(
                                                 //  width:80.0,
                                                 child: Text(
                                                   '共0件 ',
                                                   style: TextStyle(
                                                       color: Colors.redAccent),
                                                 ),
                                               ),
                                               Container(
                                                 //  width:80.0,
                                                 child: Text(
                                                   '共0.00元 ',
                                                   style: TextStyle(
                                                       color: Colors.redAccent),
                                                 ),
                                               ),
                                             ],
                                           ),
                                         ),
                                         Container(
                                           width:
                                           ScreenUtil.getInstance().screenWidth,
                                           alignment: Alignment.center,
                                           height: 50.0,
                                           decoration: BoxDecoration(
                                             // border: Border.all(width:1.0),
                                             color: Colors.redAccent,
                                           ),
                                           child: Text(
                                             '确定',
                                             style: TextStyle(color: Colors.white),
                                           ),
                                         ),
                                       ],
                                     ),
                                   ),
                                 ),
                               ],
                             ),
                           ),
                         );
                        }
                    );


                  });
            },
            child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 5.0),
                margin: EdgeInsets.only(right: 10.0),
                height: 45.0,
                width: 110.0,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  border: Border.all(
                    width: 1.0,
                    color: Colors.redAccent,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                //  margin: EdgeInsets.only(left: 5.0),
                child: Text(
                  '加入进货车',
                  style: TextStyle(color: Colors.white),
                )),
          ),
        ],
      ),
    );
  }

  int groupValue = 0;
  Widget listitem(context, index, value,state) {
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

               //   Provider.of<ColorListProvider>(context).SetColorList(colorList, index, sizeList);
                  state((){
                    groupValue =index;
                    choseSizeList =sizeList.where((item)=>item['ColorID']==colorList[groupValue]['ColorID']).toList();
                    if(sizeTxt.length>0) sizeTxt.clear();
                    for(int i=0;i<choseSizeList.length;i++){
                      TextEditingController controller =new TextEditingController();
                      controller.text ='${choseSizeList[i]['Qty']}';
                      sizeTxt.add(controller);
                    }
                  });
                  //  updateGroupValue(index);
                },
                child: Text(
                  value['title'],
                  style: TextStyle(color: Colors.white, fontSize: 11.0),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: (value['tipqty'] != 0 && value['tipqty'] != null)
                    ? Container(
                        width: 14.0,
                        height: 14,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            border: Border.all(width: 1.0, color: Colors.red),
                            borderRadius:
                                BorderRadius.all(Radius.circular(7.0))),
                        child: Text(
                          '${value['tipqty']}',
                          style: TextStyle(color: Colors.white, fontSize: 8.0),
                        ),
                      )
                    : Text(''),
              ),
            ],
          )
        : Stack(
            children: <Widget>[
              OutlineButton(
                onPressed: () {
                  print('切换${value}');
                  //   updateGroupValue(index);
                //  Provider.of<ColorListProvider>(context).SetColorList(colorList, index, sizeList);
                  state((){
                    groupValue =index;
                    choseSizeList =sizeList.where((item)=>item['ColorID']==colorList[groupValue]['ColorID']).toList();
                    if(sizeTxt.length>0) sizeTxt.clear();
                    for(int i=0;i<choseSizeList.length;i++){
                      TextEditingController controller =new TextEditingController();
                      controller.text ='${choseSizeList[i]['Qty']}';
                      sizeTxt.add(controller);
                    }
                  });
                },
                child: Text(
                  value['title'],
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 11.0),
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: (value['tipqty'] != 0 && value['tipqty'] != null)
                    ? Container(
                        width: 14.0,
                        height: 14,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.redAccent,
                            border:
                                Border.all(width: 1.0, color: Colors.redAccent),
                            borderRadius:
                                BorderRadius.all(Radius.circular(7.0))),
                        child: Text(
                          '${value['tipqty']}',
                          style: TextStyle(color: Colors.white, fontSize: 8.0),
                        ),
                      )
                    : Text(''),
              ),
            ],
          );
  }

  //添加，减
  updateQty(state,index,int qty,String Mod){
    int tipqty =0;
  state((){
   if(Mod=='add' && qty<= int.parse(choseSizeList[index]['stockQty'])){
     choseSizeList[index]['Qty'] =choseSizeList[index]['Qty']+1;
   }else if(Mod=='jian'){
     if(choseSizeList[index]['Qty']>0 )
     choseSizeList[index]['Qty'] =choseSizeList[index]['Qty']-1;
   }
   sizeTxt[index].text ='${choseSizeList[index]['Qty']}';
  // int k=0; //sizeList的键位
   sizeList.forEach((v){
     if(v['GoodsID']==choseSizeList[index]['GoodsID'] && v['ColorID']==choseSizeList[index]['ColorID'] && v['SizeID']==choseSizeList[index]['SizeID']){
       v['Qty'] =choseSizeList[index]['Qty'];
     }

     if(colorList[groupValue]['ColorID']==v['ColorID']){
        tipqty = tipqty+v['Qty'];
     }

   });
   colorList[groupValue]['Qty'] =tipqty;
   colorList[groupValue]['tipqty'] =tipqty;
  });

  print('sizeList的最终值：${sizeList}');

  }

}
