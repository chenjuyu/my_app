

import 'package:flutter/material.dart';


class CustomerScroViewDemo extends StatefulWidget {
  @override
  _CustomerScroViewDemoState createState() => _CustomerScroViewDemoState();
}

class _CustomerScroViewDemoState extends State<CustomerScroViewDemo> with SingleTickerProviderStateMixin {


  var _tabs = <String>[
  "Tab 1",
  "Tab 2",
  "Tab 3",
  ];
  TabController mController;
  int selectIndex=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mController=TabController(
      length: _tabs.length,
      vsync:this
    );
    mController.addListener((){
    //  if (mController.indexIsChanging){
     //  selectIndex=  mController.previousIndex;
      //  print('aaa:${mController.index}');
     // }
      if(mController.index.toDouble() ==mController.animation.value){
        selectIndex =mController.index;
        print('aaa:${mController.index}');
      print('selectIndex:${selectIndex}');
      }

    });
  }
  @override
  void dispose() {
    mController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: _tabs.length, // This is the number of tabs.
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            // These are the slivers that show up in the "outer" scroll view.
            return <Widget>[
              SliverOverlapAbsorber(
                handle:
                NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                child: SliverAppBar(
                  stretch: true,
                  onStretchTrigger: ((){
                    print('aaaa');
                  }),
                  title: const Text('标题'),
                  centerTitle: true,
                  pinned: true,//是否固定appbar不滑出屏幕
                  floating: false,
                  snap: false,
                  primary: true,
                  expandedHeight: 230.0,

                  elevation: 10,
                  //是否显示阴影，直接取值innerBoxIsScrolled，展开不显示阴影，合并后会显示
                  forceElevated: innerBoxIsScrolled,
               /*
                  actions: <Widget>[
                    new IconButton(
                      icon: Icon(Icons.more_horiz),
                      onPressed: () {
                        print("更多");
                      },
                    ),
                  ], */

                  flexibleSpace: new FlexibleSpaceBar(

                   background: Image.asset("images/1.JPG", fit: BoxFit.cover),
                  ),

                  bottom: TabBar(
                    controller: mController,
                    isScrollable: true,
                    onTap: (int index){
                      setState(() {
                        selectIndex =index;
                      });


                      print('切换到了$index');
                    },
                    tabs: _tabs.map((String name) => Tab(text: name)).toList(),
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            // These are the contents of the tab views, below the tabs.
            controller: mController,
            children: _tabs.map((String name) {
              //SafeArea 适配刘海屏的一个widget
              return SafeArea(
                top: false,
                bottom: false,
                child: Builder(
                  builder: (BuildContext context) {
                    return CustomScrollView(
                      key: PageStorageKey<String>(name),
                      slivers: <Widget>[
                        SliverOverlapInjector(
                          handle:
                          NestedScrollView.sliverOverlapAbsorberHandleFor(
                              context),
                        ),
                        SliverPadding(
                          padding: const EdgeInsets.all(10.0),
                          sliver: SliverFixedExtentList(
                            itemExtent: 50.0, //item高度或宽度，取决于滑动方向
                            delegate: SliverChildBuilderDelegate(
                                  (BuildContext context, int index) {
                                return ListTile(
                                  title: Text('Item $index'),
                                );
                              },
                              childCount: 30,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            }).toList(),
          ),
        ),
      ),


      /* CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            leading: new IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {},
            ),
            actions: <Widget>[
              new IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  print("添加");
                },
              ),
              new IconButton(
                icon: Icon(Icons.more_horiz),
                onPressed: () {
                  print("更多");
                },
              ),
            ],
            title: Text('slivers demo'),
            expandedHeight: 300.0,
            floating: true,
            pinned: false,
            snap: false,
          ),
          SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: new SliverChildBuilderDelegate(
            (context, index) => new ListTile(
            title: Container(
                   height: 40,
                   child: Text("Item $index"),
                   )
            ),
            childCount: 15,
            ),
            ),


        ],
      ),   */
    );
  }
}

