

class GoodsTypeModel{

  String GoodsTypeID;
  //String Code; //货品类别编码
  String Name;
  GoodsTypeModel({this.GoodsTypeID,this.Name});
  factory GoodsTypeModel.fromJson(dynamic json){

    return GoodsTypeModel(
       GoodsTypeID:json['GoodsTypeID'],
      // Code:json['Code'],
       Name: json['Name']
    );
  }
    /// must. 转成dart语言的map对象
    Map<String, dynamic> toJson() =>{
      'GoodsTypeID':GoodsTypeID,
    //  'Code':Code,
      'Name':Name,

    };
}

class GoodsTypeModelList{
  List<GoodsTypeModel> obj;
  GoodsTypeModelList({this.obj});

  GoodsTypeModelList.fromJson(Map<String, dynamic> json) {
    if (json['obj'] != null) {
      obj = new List<GoodsTypeModel>();
      json['obj'].forEach((v) {
        obj.add(new GoodsTypeModel.fromJson(v));
      });
    }
  }


}