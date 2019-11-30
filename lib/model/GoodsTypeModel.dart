
class GoodsTypeModel{

  String GoodsTypeID;
  //String Code; //货品类别编码
  String Name;
  List  subList;

  GoodsTypeModel({this.GoodsTypeID,this.Name,this.subList});
  factory GoodsTypeModel.fromJson(dynamic json){

    return GoodsTypeModel(
       GoodsTypeID:json['GoodsTypeID'],
      // Code:json['Code'],
       Name: json['Name'],
      subList:json['subList']
    );
  }
    /// must. 转成dart语言的map对象
    Map<String, dynamic> toJson() =>{
      'GoodsTypeID':GoodsTypeID,
    //  'Code':Code,
      'Name':Name,
      'subList':subList
    };
}

class GoodsTypeModelList{
  List<GoodsTypeModel> obj;
  GoodsTypeModelList({this.obj});

  GoodsTypeModelList.fromJson(Map<String, dynamic> json) {
    if (json['obj'] != null) {
      obj = new List<GoodsTypeModel>();
      json['obj'].forEach((v) {
        print(v);
        obj.add(new GoodsTypeModel.fromJson(v));
      });
    }
  }


}