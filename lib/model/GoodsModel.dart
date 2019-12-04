class GoodsModel {
  List<Goods> obj;

  GoodsModel({this.obj});

  GoodsModel.fromJson(Map<String, dynamic> json) {
    if (json['obj'] != null) {
      obj = new List<Goods>();
      json['obj'].forEach((v) {
        obj.add(new Goods.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.obj != null) {
      data['obj'] = this.obj.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Goods {
  int tempRowNumber;
  int tempColumn;
  String goodsID;
  String name;
  String goodsName;
  String code;
  bool presentFlag;
  int tradePrice;
  int retailSales;
  int discount;
  bool discountFlag;
  int retailSales1;
  String goodsType;
  String subType;
  String age;
  String season;
  Null brandSerial;
  Null style;
  Null sex;
  String kind;
  Null model;
  int retailSales2;
  int retailSales3;
  int retailSales4;
  int retailSales5;
  int retailSales6;
  int retailSales7;
  int retailSales8;
  int salesPrice1;
  int salesPrice2;
  int salesPrice3;
  int salesPrice4;
  int salesPrice5;
  int salesPrice6;
  int salesPrice7;
  int salesPrice8;
  int sizIndex;

  Goods(
      {this.tempRowNumber,
        this.tempColumn,
        this.goodsID,
        this.name,
        this.goodsName,
        this.code,
        this.presentFlag,
        this.tradePrice,
        this.retailSales,
        this.discount,
        this.discountFlag,
        this.retailSales1,
        this.goodsType,
        this.subType,
        this.age,
        this.season,
        this.brandSerial,
        this.style,
        this.sex,
        this.kind,
        this.model,
        this.retailSales2,
        this.retailSales3,
        this.retailSales4,
        this.retailSales5,
        this.retailSales6,
        this.retailSales7,
        this.retailSales8,
        this.salesPrice1,
        this.salesPrice2,
        this.salesPrice3,
        this.salesPrice4,
        this.salesPrice5,
        this.salesPrice6,
        this.salesPrice7,
        this.salesPrice8,
        this.sizIndex});

  Goods.fromJson(Map<String, dynamic> json) {
    tempRowNumber = json['tempRowNumber'];
    tempColumn = json['tempColumn'];
    goodsID = json['GoodsID'];
    name = json['Name'];
    goodsName = json['GoodsName'];
    code = json['Code'];
    presentFlag = json['PresentFlag'];
    tradePrice = json['TradePrice'];
    retailSales = json['RetailSales'];
    discount = json['Discount'];
    discountFlag = json['DiscountFlag'];
    retailSales1 = json['RetailSales1'];
    goodsType = json['GoodsType'];
    subType = json['SubType'];
    age = json['Age'];
    season = json['Season'];
    brandSerial = json['BrandSerial'];
    style = json['Style'];
    sex = json['Sex'];
    kind = json['Kind'];
    model = json['Model'];
    retailSales2 = json['RetailSales2'];
    retailSales3 = json['RetailSales3'];
    retailSales4 = json['RetailSales4'];
    retailSales5 = json['RetailSales5'];
    retailSales6 = json['RetailSales6'];
    retailSales7 = json['RetailSales7'];
    retailSales8 = json['RetailSales8'];
    salesPrice1 = json['SalesPrice1'];
    salesPrice2 = json['SalesPrice2'];
    salesPrice3 = json['SalesPrice3'];
    salesPrice4 = json['SalesPrice4'];
    salesPrice5 = json['SalesPrice5'];
    salesPrice6 = json['SalesPrice6'];
    salesPrice7 = json['SalesPrice7'];
    salesPrice8 = json['SalesPrice8'];
    sizIndex = json['sizIndex'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tempRowNumber'] = this.tempRowNumber;
    data['tempColumn'] = this.tempColumn;
    data['GoodsID'] = this.goodsID;
    data['Name'] = this.name;
    data['GoodsName'] = this.goodsName;
    data['Code'] = this.code;
    data['PresentFlag'] = this.presentFlag;
    data['TradePrice'] = this.tradePrice;
    data['RetailSales'] = this.retailSales;
    data['Discount'] = this.discount;
    data['DiscountFlag'] = this.discountFlag;
    data['RetailSales1'] = this.retailSales1;
    data['GoodsType'] = this.goodsType;
    data['SubType'] = this.subType;
    data['Age'] = this.age;
    data['Season'] = this.season;
    data['BrandSerial'] = this.brandSerial;
    data['Style'] = this.style;
    data['Sex'] = this.sex;
    data['Kind'] = this.kind;
    data['Model'] = this.model;
    data['RetailSales2'] = this.retailSales2;
    data['RetailSales3'] = this.retailSales3;
    data['RetailSales4'] = this.retailSales4;
    data['RetailSales5'] = this.retailSales5;
    data['RetailSales6'] = this.retailSales6;
    data['RetailSales7'] = this.retailSales7;
    data['RetailSales8'] = this.retailSales8;
    data['SalesPrice1'] = this.salesPrice1;
    data['SalesPrice2'] = this.salesPrice2;
    data['SalesPrice3'] = this.salesPrice3;
    data['SalesPrice4'] = this.salesPrice4;
    data['SalesPrice5'] = this.salesPrice5;
    data['SalesPrice6'] = this.salesPrice6;
    data['SalesPrice7'] = this.salesPrice7;
    data['SalesPrice8'] = this.salesPrice8;
    data['sizIndex'] = this.sizIndex;
    return data;
  }
}
