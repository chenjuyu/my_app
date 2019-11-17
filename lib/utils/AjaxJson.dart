class AjaxJson {
  Object obj;

  AjaxJson({this.obj});

  /// must.
 factory AjaxJson.fromJson( dynamic json){
    return AjaxJson(
        obj:json['obj']
    );
 }

  /// must.
  Map<String, dynamic> toJson() => {
    'obj': obj,
  };

  @override
  String toString() {
    StringBuffer sb = new StringBuffer('{');
    sb.write("\"obj\":\"$obj\"");
    sb.write('}');
    return sb.toString();
  }
}