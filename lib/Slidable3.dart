
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


class Data {
  final String url = 'https://via.placeholder.com/350x150';
}

class Sidable3 extends StatefulWidget {
  @override
  _Sidable3State createState() => _Sidable3State();
}
Future<Data> getData() async {
  await Future.delayed(Duration(seconds: 1));
  return Data();
}
class _Sidable3State extends State<Sidable3> {
  final SlidableController slidableController = SlidableController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('demo3'),
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return FutureBuilder<Data>(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Slidable(
                  actionPane: SlidableScrollActionPane(),
                  actionExtentRatio: 0.25,
                  secondaryActions: <Widget>[
                    IconSlideAction(
                      caption: 'Delete',
                      color: Colors.red,
                      icon: Icons.delete,
                      //onTap: () => removeLocation(location),
                    ),
                    IconSlideAction(
                      caption: '置顶',
                      color: Colors.orange,
                      icon: Icons.delete,
                      //onTap: () => removeLocation(location),
                    ),


                  ],
                  child: ListTile(
                    // onTap: () {
                    //   Navigator.pushNamed(context, Routes.closeUp);
                    // },

                    leading: SizedBox(
                      width: 64.0,
                      height: 64.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(64.0),
                        child: RepaintBoundary(
                          child: Image(
                            image: NetworkImage(snapshot.data.url),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }
              return CircularProgressIndicator();
            },
          );
        },
      ),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}
