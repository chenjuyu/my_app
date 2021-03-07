import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flustars/flustars.dart';
import './component/adjustable_bottomsheet.dart';
import 'package:provider/provider.dart';
import './provider/CartProvider.dart';
import 'package:my_app/Cart_Page.dart';
import 'package:my_app/utils/global.dart';
//使用静态组件

class ProductDetailPage extends StatefulWidget {
  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  List colorList = [
    {
      'GoodsID': 'OOAC',
      'Code': '9LA119M310',
      'Name': '测试货号',
      'ColorID': '00A',
      "Color": "红色",
      "type": 0,
      'tipqty': 1,
      'Quantity': 0,
      'Price': 30.0,
      'Amount': 0.00,
    },
    {
      'GoodsID': 'OOAC',
      'Code': '9LA119M310',
      'Name': '测试货号',
      'ColorID': '00B',
      "Color": "白色",
      "type": 1,
      'tipqty': 2,
      'Quantity': 0,
      'Price': 30.0,
      'Amount': 0.00,
    },
    {
      'GoodsID': 'OOAC',
      'Code': '9LA119M310',
      'Name': '测试货号',
      'ColorID': '00C',
      "Color": "橙色",
      "type": 2,
      'tipqty': 0,
      'Quantity': 0,
      'Price': 30.0,
      'Amount': 0.00,
    },
    {
      'GoodsID': 'OOAC',
      'Code': '9LA119M310',
      'Name': '测试货号',
      'ColorID': '00D',
      "Color": "黄色",
      "type": 3,
      'tipqty': 0
    },
    {
      'GoodsID': 'OOAC',
      'Code': '9LA119M310',
      'Name': '测试货号',
      'ColorID': '00E',
      "Color": "绿色",
      "type": 4,
      'tipqty': 0
    },
    {
      'GoodsID': 'OOAC',
      'Code': '9LA119M310',
      'Name': '测试货号',
      'ColorID': '00F',
      "Color": "青色",
      "type": 5,
      'tipqty': 0
    },
    {
      'GoodsID': 'OOAC',
      'Code': '9LA119M310',
      'Name': '测试货号',
      'ColorID': '00G',
      "Color": "蓝色",
      "type": 6,
      'tipqty': 0
    },
    {
      'GoodsID': 'OOAC',
      'Code': '9LA119M310',
      'Name': '测试货号',
      'ColorID': '00H',
      "Color": "紫色",
      "type": 7,
      'tipqty': 0
    },
    {
      'GoodsID': 'OOAC',
      'Code': '9LA119M310',
      'Name': '测试货号',
      'ColorID': '00I',
      "Color": "红白色",
      "type": 8,
      'tipqty': 0
    },
    {
      'GoodsID': 'OOAC',
      'Code': '9LA119M310',
      'Name': '测试货号',
      'ColorID': '00J',
      "Color": "天蓝色",
      "type": 9,
      'tipqty': 0
    },
    {
      'GoodsID': 'OOAC',
      'Code': '9LA119M310',
      'Name': '测试货号',
      'ColorID': '00K',
      "Color": "蓝紫色",
      "type": 10,
      'tipqty': 0
    },
  ];

  //List
  List sizeList = [
    {
      'GoodsID': 'OOAC',
      'Code': '9LA119M310',
      'Name': '测试货号',
      'ColorID': '00A',
      "Color": "红色",
      'SizeID': 'OOA',
      'Size': '35',
      'Price': 30.0,
      'stockQty': '35',
      'Quantity': 35,
      'Amount': 0.00,
    },
    {
      'GoodsID': 'OOAC',
      'Code': '9LA119M310',
      'Name': '测试货号',
      'ColorID': '00A',
      "Color": "红色",
      'SizeID': 'OOB',
      'Size': '36',
      'Price': 30.0,
      'stockQty': '36',
      'Quantity': 36,
      'Amount': 0.00,
    },
    {
      'GoodsID': 'OOAC',
      'Code': '9LA119M310',
      'Name': '测试货号',
      'ColorID': '00B',
      'Color': '红色',
      'SizeID': 'OOC',
      'Size': '37',
      'Price': 30.0,
      'stockQty': '37',
      'Quantity': 37,
      'Amount': 0.00,
    },
    {
      'GoodsID': 'OOAC',
      'Code': '9LA119M310',
      'Name': '测试货号',
      'ColorID': '00B',
      'Color': '红色',
      'SizeID': 'OOD',
      'Size': '38',
      'Price': 30.0,
      'stockQty': '38',
      'Quantity': 38,
      'Amount': 0.00,
    },
    {
      'GoodsID': 'OOAC',
      'Code': '9LA119M310',
      'Name': '测试货号',
      'ColorID': '00C',
      'Color': '黄色',
      'SizeID': 'OOE',
      'Size': '39',
      'Price': 30.0,
      'stockQty': '39',
      'Quantity': 39,
      'Amount': 0.00,
    },
    {
      'GoodsID': 'OOAC',
      'Code': '9LA119M310',
      'Name': '测试货号',
      'ColorID': '00C',
      'Color': '黄色',
      'SizeID': 'OOE',
      'Size': '40',
      'Price': 30.0,
      'stockQty': '40',
      'Quantity': 40,
      'Amount': 0.00,
    },
    {
      'GoodsID': 'OOAC',
      'Code': '9LA119M310',
      'Name': '测试货号',
      'ColorID': '00D',
      'Color': '蓝色',
      'SizeID': 'OOE',
      'Size': '41',
      'Price': 30.0,
      'stockQty': '41',
      'Quantity': 41,
      'Amount': 0.00,
    },
  ];

  List<TextEditingController> sizeTxt = [];

  List choseSizeList = [];

  int selectIndex = 0;

  int totalQty = 0;
  double totalAmt = 0.0;

  int cartQuantityTotal = 0;

  @override
  Widget build(BuildContext context) {
    //  Provider.of<ColorListProvider>(context).SetColorList(colorList, selectIndex, sizeList);
    // choseSizeList =Provider.of<ColorListProvider>(context).choseSizeList;

    //  getCartTotal(context);

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
            fit: BoxFit
                .cover, //cover 效果是最好的 //BoxFit.fitWidth, //BoxFit.contain,
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
          Stack(
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartPage()),
                  );
                },
                child: Container(
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
                      Icon(Icons.shopping_cart,
                          size: 25.0, color: Colors.black26),
                      // Text('收藏',style: TextStyle(fontSize: 10.0,color: Colors.black26),)
                    ],
                  ),
                ),
              ),
              Positioned(
                  top: 0,
                  right: 0,
                  child: cartQuantityTotal != 0
                      ? Container(
                          alignment: Alignment.center,
                          height: 20.0,
                          width: 20.0,
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            border: Border.all(
                              width: 1.0,
                              color: Colors.redAccent,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          child: Text(
                            '${cartQuantityTotal}',
                            style:
                                TextStyle(color: Colors.white, fontSize: 8.0),
                          ),
                        )
                      : Text('')),
            ],
          ),
          InkWell(
            onTap: () {
              choseSizeList = sizeList
                  .where((item) =>
                      item['ColorID'] == colorList[groupValue]['ColorID'])
                  .toList();
              if (sizeTxt.length > 0) sizeTxt.clear();
              for (int i = 0; i < choseSizeList.length; i++) {
                TextEditingController controller = new TextEditingController();
                controller.text = '${choseSizeList[i]['Quantity']}';
                sizeTxt.add(controller);
              }

              showAdjustableBottomSheet(
                  //showModalBottomSheet showAdjustableBottomSheet
                  isScrollControlled: false,
                  useRootNavigator: false,
                  context: context,
                  builder: (BuildContext context) {
                    return StatefulBuilder(builder: (context1, state) {
                      ///这里的state就是setState

                      return AnimatedPadding(
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
                                            padding: const EdgeInsets.only(left: 10),
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
                                       // margin: EdgeInsets.only(bottom: 10.0),
                                      padding: EdgeInsets.only(right:10),
                                        height: (colorList.length / 5 * 60.0),
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
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          children: colorList
                                              .asMap()
                                              .keys
                                              .map((index) {
                                            return listitem(context, index,
                                                colorList[index], state);
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
                                                            color: Colors
                                                                .black12))),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                    Container(
                                                      child: Text(
                                                          '${choseSizeList[index]['Size']}'),
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
                                                            onTap: () {
                                                              updateQty(
                                                                  state,
                                                                  index,
                                                                  int.parse(sizeTxt[
                                                                          index]
                                                                      .text),
                                                                  'jian');
                                                            },
                                                            child: Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      left:
                                                                          10.0),
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              height: 30.0,
                                                              width: 30.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                border: Border.all(
                                                                    width: 1.0,
                                                                    color: Colors
                                                                        .black12),
                                                                color: Color
                                                                    .fromRGBO(
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
                                                            child:
                                                                ConstrainedBox(
                                                              constraints:
                                                                  BoxConstraints(
                                                                maxWidth: 30.0,
                                                                maxHeight: 30.0,
                                                              ),
                                                              child: TextField(
                                                                onChanged: (v) {
                                                                  if (int.parse(
                                                                              v)
                                                                          is int &&
                                                                      int.parse(
                                                                              v) <=
                                                                          int.parse(choseSizeList[index]
                                                                              [
                                                                              'stockQty'])) {
                                                                    print(v);
                                                                    state(() {
                                                                      choseSizeList[index]
                                                                              [
                                                                              'Quantity'] =
                                                                          int.parse(
                                                                              v);
                                                                      int tipqty =
                                                                          0;
                                                                      sizeList
                                                                          .forEach(
                                                                              (v) {
                                                                        if (v['GoodsID'] == choseSizeList[index]['GoodsID'] &&
                                                                            v['ColorID'] ==
                                                                                choseSizeList[index]['ColorID'] &&
                                                                            v['SizeID'] == choseSizeList[index]['SizeID']) {
                                                                          v['Quantity'] =
                                                                              choseSizeList[index]['Quantity'];
                                                                        }
                                                                        if (colorList[groupValue]['ColorID'] ==
                                                                            v['ColorID']) {
                                                                          tipqty =
                                                                              tipqty + v['Quantity'];
                                                                        }
                                                                        //提示数量
                                                                      });
                                                                      colorList[groupValue]
                                                                              [
                                                                              'tipqty'] =
                                                                          tipqty;
                                                                      print(
                                                                          'sizeList的最终值：${sizeList}');
                                                                    });
                                                                  }
                                                                },
                                                                controller:
                                                                    sizeTxt[
                                                                        index],
                                                                keyboardType:
                                                                    TextInputType
                                                                        .number,
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
                                                            onTap: () {
                                                              updateQty(
                                                                  state,
                                                                  index,
                                                                  int.parse(sizeTxt[
                                                                          index]
                                                                      .text),
                                                                  'add');
                                                            },
                                                            child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              height: 30.0,
                                                              width: 30.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                border: Border.all(
                                                                    width: 1.0,
                                                                    color: Colors
                                                                        .black12),
                                                                color: Color
                                                                    .fromRGBO(
                                                                        236,
                                                                        236,
                                                                        236,
                                                                        1.0),
                                                              ),
                                                              child: Text('+'),
                                                            ),
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
                                                '共${totalQty}件 ',
                                                style: TextStyle(
                                                    color: Colors.redAccent),
                                              ),
                                            ),
                                            Container(
                                              //  width:80.0,
                                              child: Text(
                                                '共${totalAmt}元 ',
                                                style: TextStyle(
                                                    color: Colors.redAccent),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          var haveData = sizeList.where(
                                              (item) =>
                                                  item['Quantity'] != 0 &&
                                                  item['Quantity'] != null);
                                          if (haveData != null) {
                                            getProviderData(context, haveData);
                                            getCartTotal(context);
                                          }
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          width: ScreenUtil.getInstance()
                                              .screenWidth,
                                          alignment: Alignment.center,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            // border: Border.all(width:1.0),
                                            color: Colors.redAccent,
                                          ),
                                          child: Text(
                                            '确定',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
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
                    });
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

  Widget listitem(context, index, value, state) {
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
                  state(() {
                    groupValue = index;
                    choseSizeList = sizeList
                        .where((item) =>
                            item['ColorID'] == colorList[groupValue]['ColorID'])
                        .toList();
                    if (sizeTxt.length > 0) sizeTxt.clear();
                    for (int i = 0; i < choseSizeList.length; i++) {
                      TextEditingController controller =
                          new TextEditingController();
                      controller.text = '${choseSizeList[i]['Quantity']}';
                      sizeTxt.add(controller);
                    }
                  });
                  //  updateGroupValue(index);
                },
                child: Text(
                  value['Color'],
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
                  state(() {
                    groupValue = index;
                    choseSizeList = sizeList
                        .where((item) =>
                            item['ColorID'] == colorList[groupValue]['ColorID'])
                        .toList();
                    if (sizeTxt.length > 0) sizeTxt.clear();
                    for (int i = 0; i < choseSizeList.length; i++) {
                      TextEditingController controller =
                          new TextEditingController();
                      controller.text = '${choseSizeList[i]['Quantity']}';
                      sizeTxt.add(controller);
                    }
                  });
                },
                child: Text(
                  value['Color'],
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
  void updateQty(state, index, int qty, String Mod) {

    int tipqty = 0;
    state(() {
      if (Mod == 'add') {
        if(qty <= int.parse(choseSizeList[index]['stockQty'])) {
          choseSizeList[index]['Quantity'] =
              choseSizeList[index]['Quantity'] + 1;
        }else{
          G.toast('增加数量不可大于库存数');
        }
      } else if (Mod == 'jian') {
        if (choseSizeList[index]['Quantity'] > 0)
          choseSizeList[index]['Quantity'] =
              choseSizeList[index]['Quantity'] - 1;
      }
      sizeTxt[index].text = '${choseSizeList[index]['Quantity']}';
      // int k=0; //sizeList的键位
      sizeList.forEach((v) {
        if (v['GoodsID'] == choseSizeList[index]['GoodsID'] &&
            v['ColorID'] == choseSizeList[index]['ColorID'] &&
            v['SizeID'] == choseSizeList[index]['SizeID']) {
          v['Quantity'] = choseSizeList[index]['Quantity'];
          v['Amount'] = v['Quantity'] * v['Price'];
        }

        if (colorList[groupValue]['ColorID'] == v['ColorID']) {
          tipqty = tipqty + v['Quantity'];
        }
      });
      colorList[groupValue]['Quantity'] = tipqty;
      colorList[groupValue]['tipqty'] = tipqty;
      colorList[groupValue]['Amount'] =
          colorList[groupValue]['Quantity'] * colorList[groupValue]['Price'];
      //全部合计
      totalQty = 0;
      totalAmt = 0.0;
      colorList.forEach((v) {
        totalQty = totalQty + v['Quantity'];
        totalAmt = totalAmt + v['Amount'];
      });
    });

    print('sizeList的最终值：${sizeList}');
  }

  //不加异步方法，会返回null值注意大坑
  getProviderData(context1, haveData) async {
    Provider.of<CartProvider>(context1).addCartInfo(haveData.toList());
    // Provider.of<CartProvider>(context1).getCartInfo();
    print('本地持久化中的数据:${await Provider.of<CartProvider>(context1).cartInfo}');
  }

  getCartTotal(context) async {
    await Provider.of<CartProvider>(context).getGoodsTotal();
    setState(() {
      cartQuantityTotal = Provider.of<CartProvider>(context).totalQuantity;
      print('cartQuantityTotal:${cartQuantityTotal}');
    });
  }
}
