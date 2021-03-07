

import 'package:flutter/material.dart';
import 'package:color_dart/color_dart.dart';

class CustomerScroViewDemo extends StatefulWidget {
  @override
  _CustomerScroViewDemoState createState() => _CustomerScroViewDemoState();
}
// SingleTickerProviderStateMixin
class _CustomerScroViewDemoState extends State<CustomerScroViewDemo> with TickerProviderStateMixin,AutomaticKeepAliveClientMixin  {

 @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

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
                sliver: SliverAppBar( //child
                  title: Text('标题'),
                  centerTitle: true,
                  pinned: false,//是否固定appbar不滑出屏幕
                  floating: false,
                  snap: false,
                  primary: true,
                  expandedHeight: 150.0,
              //    backgroundColor: Colors.redAccent,
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
                /*
                  bottom:TabBar(
                    controller: mController,
                    isScrollable: true,
                    onTap: (int index){
                      setState(() {
                        selectIndex =index;
                      });


                      print('切换到了$index');
                    }, //text: name,
                    tabs: _tabs.map((String name) => Tab(child: Align(alignment: Alignment.topCenter,child: Text(name),),),).toList(),
                  ),
                  */
                ),
              ),
              SliverPersistentHeader(
                pinned: true, //固定在顶部
                floating: true,
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    indicatorColor: Colors.redAccent,
                    labelColor: Colors.redAccent,
                    unselectedLabelColor: Colors.black,
                  controller: mController,
                  isScrollable: true,
                  onTap: (int index){
                    setState(() {
                      selectIndex =index;
                    });


                    print('切换到了$index');
                  }, //text: name,
                  tabs: _tabs.map((String name) => Tab(text: name,)).toList(),
                ),),
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

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {

  final TabBar _tabBar;
  _SliverAppBarDelegate(this._tabBar);
  @override
  double get minExtent =>70.0;//_tabBar.preferredSize.height;

  @override
  double get maxExtent => 70.0;//_tabBar.preferredSize.height;



  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
   // print('高度:${maxExtent}');
    return Container(
        padding: EdgeInsets.only(top: 25),
      //width: double.infinity, hex('#108ee9')
      decoration: BoxDecoration(
        color:  hex('#108ee9'),
      ),
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

