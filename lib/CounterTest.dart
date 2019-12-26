
import 'package:flutter/material.dart';
import 'package:my_app/provider/Counter.dart';
import 'package:provider/provider.dart';

class CounterTest extends StatefulWidget {
  @override
  _CounterTestState createState() => _CounterTestState();
}

class _CounterTestState extends State<CounterTest> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title:Text('测试'),
        centerTitle: true,
       ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              child: Text('${Provider.of<Counter>(context).count}'),
            ),
            InkWell(
              onTap: (){
                Provider.of<Counter>(context).increment();
              },
              child: Container(
                child: Text('加1'),
              ),
            ),
          
          ],
        ),

      ) ,
    );

  }
}
//测试静态类时，就要用到Provider 变化属性的更新
class Test extends StatelessWidget {




  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


