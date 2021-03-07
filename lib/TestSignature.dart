import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class TestSignature extends StatefulWidget {
  @override
  _TestSignatureState createState() => _TestSignatureState();
}

class _TestSignatureState extends State<TestSignature> {

  final SignatureController _controller = SignatureController(
    penStrokeWidth: 1,
    penColor: Colors.red,
    exportBackgroundColor: Colors.blue,
  );

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => print('Value changed'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          title: Text('签名测试',style: TextStyle(fontSize: 18.0),),
          centerTitle: true,
        ),
       preferredSize:Size.fromHeight(40.0),
      ),
      body: ListView(
        children: [
          Container(
            height: 300,
            child: const Center(
              child: Text('Big container to test scrolling issues'),
            ),
          ),
          //SIGNATURE CANVAS
          Signature(
            controller: _controller,
            height: 300,
            backgroundColor: Colors.lightBlueAccent,
          ),
          //OK AND CLEAR BUTTONS
          Container(
            decoration: const BoxDecoration(color: Colors.black),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                //SHOW EXPORTED IMAGE IN NEW ROUTE
                IconButton(
                  icon: const Icon(Icons.check),
                  color: Colors.blue,
                  onPressed: () async {
                    if (_controller.isNotEmpty) {
                      final Uint8List data = await _controller.toPngBytes();
                      await Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) {
                            return Scaffold(
                              appBar: AppBar(),
                              body: Center(
                                child: Container(
                                  color: Colors.grey[300],
                                  child: Image.memory(data),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }
                  },
                ),
                //CLEAR CANVAS
                IconButton(
                  icon: const Icon(Icons.clear),
                  color: Colors.blue,
                  onPressed: () {
                    setState(() => _controller.clear());
                  },
                ),
              ],
            ),
          ),
          Container(
            height: 300,
            child: const Center(
              child: Text('Big container to test scrolling issues'),
            ),
          ),
        ],

      ),
    );
  }
}

