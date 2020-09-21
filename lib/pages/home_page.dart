import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zhihu/pages/home/tab_a_page.dart';
import 'package:flutter_zhihu/widget/primary_scroll_container.dart';
import '../config/index.dart';
import 'base_automatic_page.dart';
import 'home/tab_b_page.dart';
import 'home/tab_c_page.dart';
import 'home/tab_d_page.dart';

class HomePage extends AutomaticPage {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends AutomaticPageState<HomePage> with SingleTickerProviderStateMixin{
  final ScrollController _scrollController  = ScrollController();
  TabController _tabController;
  List<GlobalKey<PrimaryScrollContainerState>> scrollChildKeys;

  //AppBar().preferredSize.height
//  @override
//  bool get wantKeepAlive => true;


  final List<Widget> tabs = [
    Tab(text: '关注'),
    Tab(text: '推荐'),
    Tab(text: '热榜'),
    Tab(text: '圈子'),
  ];


  @override
  void initState() {
    super.initState();
    scrollChildKeys =List.generate(tabs.length, (index) => GlobalKey());
    _tabController = new TabController(length: tabs.length, vsync: this);
    _tabController.addListener(() {
      if(_tabController.indexIsChanging){
        var index = _tabController.index;
        var previousIndex = _tabController.previousIndex;
        print('点击第${index}个菜单');
      }
      for(int i = 0; i < scrollChildKeys.length; i++){
        GlobalKey<PrimaryScrollContainerState> key = scrollChildKeys[i];
        if (key.currentState != null) {
          key.currentState.onPageChange(_tabController.index == i);//控制是否当前显示
        }
      }
    });


//    _scrollController.addListener(() {
//      print('滚动=${_scrollController.position}');
//    });
  }



  @override
  Widget build(BuildContext context) {
    super.build(context);
    print('首页页面-build');
  return Column(
    children: <Widget>[
      getAppBarUI(context),
      Expanded(
          child: NestedScrollView(
            scrollDirection: Axis.vertical,
            controller: _scrollController,
            headerSliverBuilder: (BuildContext context,bool innerBoxIsScrolled){
              return <Widget>[
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context,int index){
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Row(
                          children: <Widget>[
                            Container(
                              alignment:Alignment.center,
                              width: ScreenUtil().setWidth(100),
                              height: ScreenUtil().setHeight(100),
                              //color: Colors.amber,
                              child: Text(KString.text_LiveBroadcast,style: TextStyle(fontSize: ScreenUtil().setSp(35)),),
                            ),
                            SizedBox(
                              width: ScreenUtil().setWidth(550),
                              height: ScreenUtil().setHeight(100),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8,bottom: 8,left: 0,right: 0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: KColor.tabBarTextfieldBg,
                                    borderRadius: BorderRadius.all(Radius.circular(30)),

                                  ),
                                  child: Stack(
                                    children: <Widget>[
                                      Positioned(
                                          child: Icon(Icons.search,color: KColor.tabTextColor,),
                                        left: 15,
                                        top: 3,
                                      ),
                                      Positioned(
                                        child: Text(KString.home_TextField_hint,style: TextStyle(color: KColor.tabTextColor),),
                                        left: 55,
                                        top: 5,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              alignment:Alignment.center,
                              width: ScreenUtil().setWidth(100),
                              height: ScreenUtil().setHeight(100),
                              //color: Colors.amber,
                              child: IconButton(
                                  icon: Icon(
                                    Icons.add_circle,
                                    color: KColor.primaryColor,
                                    size: 30,
                                  ),
                                  onPressed: (){

                                  }),
                            ),

                          ],
                        ),
                      );
                    },

                    childCount: 1,
                  ),
                ),

                SliverPersistentHeader(
                  pinned: true,
                  floating: true,
                  delegate: StickyTabBarDelegate(
                    child: Material(
                        color: Colors.white,
                        elevation: 3,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: TabBar(
                            controller: _tabController,
                            tabs: tabs,
                            isScrollable: true,
                            indicatorSize: TabBarIndicatorSize.label,
                            labelColor: Colors.black,
                            labelStyle: TextStyle(
                              fontSize: ScreenUtil().setSp(40),
                              fontWeight: FontWeight.bold,
                            ),
                            //未选中颜色与样式
                            unselectedLabelColor: KColor.tabTextColor,
                            unselectedLabelStyle: TextStyle(
                              fontSize: ScreenUtil().setSp(30),
                              fontWeight: FontWeight.normal,
                            ),
                            indicatorColor: Colors.white,
                          ),
                        ),
                    ),

                    //getFilterBarUI()
                  ),

                ),
              ];
            },
            body: TabBarView(
              controller: _tabController,
              children: <Widget>[
                PrimaryScrollContainer(scrollChildKeys[0], TabAPage()),
                PrimaryScrollContainer(scrollChildKeys[1], TabBPage()),
                PrimaryScrollContainer(scrollChildKeys[2], TabCPage()),
                PrimaryScrollContainer(scrollChildKeys[3], TabDPage()),
              ],
            ),
          ),
      ),
    ],
  );

  }


}


Widget getAppBarUI(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only( top: MediaQuery.of(context).padding.top, left: 8, right: 8),
  );
}



class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  StickyTabBarDelegate({@required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: this.child,
    );
  }

//  @override
//  double get maxExtent => this.child.createElement().size.height;
//
//  @override
//  double get minExtent => this.child.createElement().size.height;

  @override
  double get maxExtent => 52.0;

  @override
  double get minExtent => 52.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}