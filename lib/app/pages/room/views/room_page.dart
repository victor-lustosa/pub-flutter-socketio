import 'package:flutter/material.dart';
import 'package:pub/app/pages/room/views/components/room_page_one_widget.dart';
import 'package:pub/app/pages/user/models/user.dart';
import '../../../core/configs/app_colors.dart';
import '../models/room.dart';
import '../view_models/room_view_model.dart';
import 'components/room_bar_widget.dart';
import 'components/room_page_two_widget.dart';
import 'components/room_tab_bar_sliver_widget.dart';

class RoomPage extends StatefulWidget {

  final Room room;
  final User user;

  RoomPage(this.room, this.user);

  @override
  _RoomPageState createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage>
    with SingleTickerProviderStateMixin {

  late final RoomViewModel instance;
  late TabController _tabController;
  late ScrollController _scrollViewController;

  @override
  void initState() {
    instance = RoomViewModel(room:this.widget.room,user: this.widget.user);
    _scrollViewController = ScrollController(initialScrollOffset: 0.0);
    _tabController = TabController(vsync: this, length: 2);
    super.initState();
  }
  @override
  void dispose() {
    instance.dispose();
    _tabController.dispose();
    _scrollViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: NestedScrollView(
            controller: _scrollViewController,
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  flexibleSpace: FlexibleSpaceBar(
                    background: RoomBarWidget(this.widget.room),
                  ),
                  automaticallyImplyLeading: false,
                  backgroundColor: AppColors.white,
                  pinned: true,
                  snap: true,
                  floating: true,
                  expandedHeight: 85.0,
                  collapsedHeight: 28,
                  toolbarHeight: 28,
                  bottom: RoomTabBarSliverWidget(_tabController),
                )];},
            body: TabBarView( controller: _tabController, children: <Widget>[
              RoomPageOneWidget(instance,this.widget.room, this.widget.user),
              // Visibility(visible: true,
              //     child: Container(
              //       decoration: BoxDecoration(
              //         color: AppColors.brown,
              //           borderRadius: BorderRadius.all(const Radius.circular(10.0))),
              //       child: Row(mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           IconButton(onPressed:() {}, icon: Icon(Icons.remove,size: 10,color: Color(0xFFFFFFFF),))
              //         ],
              //       ),
              //     )),
              RoomPageTwoWidget(instance)
            ])));
  }
}
