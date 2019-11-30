

class GoodsSubType {
  String GoodsSubTypeID;
  String GoodsTypeID;
  String Name;
  GoodsSubType({this.GoodsSubTypeID,this.GoodsTypeID,this.Name});
  factory GoodsSubType.fromJson(dynamic json){

    return GoodsSubType(
        GoodsSubTypeID : json['GoodsSubTypeID'],
        GoodsTypeID :json['GoodsTypeID'],
        Name: json['Name'],
    );
  }
}
class  GoodsSubTypeList{

  List<GoodsSubType> obj;
   GoodsSubTypeList.fromJson(Map<String,dynamic> json){
     if(json['obj'] !=null){
       obj =new List<GoodsSubType>();
       json['obj'].forEach((v){ //把数据取出来
         obj.add(GoodsSubType.fromJson(v));
       });
     }

  }


}