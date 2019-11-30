import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:color_dart/color_dart.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:flustars/flustars.dart';
import 'package:my_app/MainPage.dart';
class SelectDate extends StatefulWidget {
  @override
  _SelectDateState createState() => _SelectDateState();
}
 String INIT_DATETIME = DateUtil.formatDate(DateTime.now(),format: 'yyyy-MM-dd');
class _SelectDateState extends State<SelectDate> {
  DateTime _dateTime;
  String _format = 'yyyy-MM-dd';
  DateTimePickerLocale _locale = DateTimePickerLocale.zh_cn;
  TextEditingController _formatCtrl = TextEditingController();
  TextEditingController _beginDate = TextEditingController();
  TextEditingController _endDate = TextEditingController();
  @override
  void initState() {
    super.initState();
    _formatCtrl.text = _format;
    _dateTime = DateTime.parse(INIT_DATETIME);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar:PreferredSize(
            child:
            AppBar(
              title: const Text('选择条件',textAlign: TextAlign.center,style: TextStyle(fontSize: 18.0),),
              centerTitle: true,
              backgroundColor:hex('#108ee9'),
              actions: <Widget>[
                IconButton(

                  icon:Icon(Icons.done,color: Colors.white,),
                  onPressed: (){
                    var map ={'BeginDate':_beginDate.text,'EndDate':_endDate.text};
                    Navigator.pop(context,map);
                  //  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>xx()));
                   //替换路由 不是返回上一个了页面了把当前页面的路由替换成另外 一个  Navigator.of(context).pushReplacement(newRoute)
                    // 返回根首页即 根目录
                  //  Navigator.of(context).pushAndRemoveUntil(
                 //   MaterialPageRoute(builder: (context)=>MainPage()),
                 //       (route)=>route==null);
                  },

                ),
              ],
            ),
            preferredSize: Size.fromHeight(40.0)
        ),
        body: _col(context),
      ),
    );
  }

  /// Display date picker.

  void _showDatePicker(TextEditingController str) {
    DatePicker.showDatePicker(
      context,
      pickerTheme: DateTimePickerTheme(
        showTitle: true,
        confirm: Text('确定', style: TextStyle(color: hex('#108ee9'))),
        cancel: Text('取消', style: TextStyle(color: Colors.cyan)),
      ),
      minDateTime: DateTime.parse('1910-01-01'),
      maxDateTime: DateTime.parse('2039-12-31'),
      initialDateTime: _dateTime,
      dateFormat: _format,
      locale: _locale,
      onClose: () => print("----- onClose -----"),
      onCancel: () => print('onCancel'),
      onChange: (dateTime, List<int> index) {
        setState(() {
          _dateTime = dateTime;
        });
      },
      onConfirm: (dateTime, List<int> index) {
        setState(() {
          _dateTime = dateTime;
        });
        str.text =DateUtil.formatDate(_dateTime,format: 'yyyy-MM-dd');
      },
    );
  }

  Widget _col(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            height: 40.0,
            margin: EdgeInsets.only(top: 5.0),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(width: 1.0,color: hex('#DCDCDC')))
            ),
            child: Row(
              children: <Widget>[
                Container(
                  child:  Text('开始日期'),
                ),
                Container(
                  margin:EdgeInsets.only(left: 30.0),
                  child:   ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 50.0,
                      maxWidth: 150.0,
                    ),
                    child:TextField(
                      controller: _beginDate,
                      readOnly: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none //设置无边框
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 4.0)
                      ),
                      onTap: (){
                        _showDatePicker(_beginDate);
                      },
                    ),
                  ),
                ),


              ],
            ),
          ),
          Container(
            height: 40.0,
            margin: EdgeInsets.only(top: 5.0),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(width: 1.0,color: hex('#DCDCDC')))
            ),
            child: Row(
              children: <Widget>[
                Container(
                  child:  Text('结束日期'),
                ),
                Container(
                  margin:EdgeInsets.only(left: 30.0),
                  child:ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 50.0,
                      maxWidth: 150.0,
                    ),
                    child:TextField(
                      controller: _endDate,
                      readOnly: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none //设置无边框
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 4.0)
                      ),
                      onTap: (){
                        _showDatePicker(_endDate);
                      },
                    ),
                  ),
                ),


              ],
            ),
          ),
        ],
      ),
    );

  }




}


