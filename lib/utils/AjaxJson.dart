class AjaxJson {
  Object obj;
  String id;
  bool success;
  String msg;
  Map<String,Object> attributes;
  AjaxJson({this.id,this.attributes,this.msg,this.obj,this.success});

  /// must.
 factory AjaxJson.fromJson( dynamic json){
    return AjaxJson(
        id:json['id'],
        attributes:json['attributes'],
        msg:json['msg'],
        obj:json['obj'],
        success: json['success']
    );
 }

  /// must. 转成dart语言的map对象
  Map<String, dynamic> toJson() => {
    'id':id,
    'attributes':attributes,
    'msg':msg,
    'obj': obj,
    'success':success
  };

  @override
  String toString() {
    StringBuffer sb = new StringBuffer('{');
    sb.write("\"obj\":\"$obj\"");
    sb.write('}');
    return sb.toString();
  }
}