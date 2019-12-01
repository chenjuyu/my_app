import 'package:dio/dio.dart';
import 'global.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Request {

  Dio dio =Dio();

 Future get(String path, Map<String,dynamic> map) async{
   SharedPreferences pref =await SharedPreferences.getInstance();
   Options options =Options(headers: {'Content-Type':'application/json;charset=UTF-8','Cookie':(pref.getString('cookie')!=null && pref.getString('cookie') !='')?pref.getString('cookie'):''});
 try {
   Response res = await dio.get(
       pref.getString('ip') + path, queryParameters: map, options: options);

   if (res.headers.map.containsKey('set-cookie')) {
     pref.setString('cookie', res.headers['set-cookie'].toString());
   }
   return res;
 }catch(e){
   return '网络请求异常';
 }
  }

 Future post(String path,Map<String,dynamic> map) async{
   SharedPreferences pref =await SharedPreferences.getInstance(); //application/json;charset=UTF-8
   Options options =Options(headers: {'Content-Type':'application/json;charset=UTF-8','Cookie':(pref.getString('cookie')!=null && pref.getString('cookie') !='')?pref.getString('cookie'):''});
  try {

    Response res = await dio.post(
        pref.getString('ip') + path, queryParameters: map, options: options);

    if (res.headers.map.containsKey('set-cookie')) {
      pref.setString('cookie', res.headers['set-cookie'][0].toString());
      print('Resquest中的set-cookie:${res.headers['set-cookie'][0]}');
      print('Resquest中的getcookie:${pref.getString('cookie')}');
    }
    return res;
  }catch(e){
    return e;
  }
 }


}
