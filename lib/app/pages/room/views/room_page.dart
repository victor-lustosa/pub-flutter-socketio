import 'package:flutter/material.dart';
import 'package:pub/app/core/room_bloc/room_bloc.dart';
import 'package:pub/app/pages/participant/view_models/participant_view_model.dart';
import 'package:pub/app/pages/room/views/components/room_page_one_widget.dart';
import 'package:pub/app/pages/user/models/user.dart';
import '../../../core/configs/app_colors.dart';
import '../../participant/models/participant.dart';
import '../models/room.dart';
import '../view_models/room_view_model.dart';
import 'components/room_bar_widget.dart';
import 'components/room_page_two_widget.dart';
import 'components/room_tab_bar_sliver_widget.dart';

class RoomPage extends StatefulWidget {

  final RoomBloc bloc;
  final RoomViewModel roomViewModel;

  RoomPage(this.bloc, this.roomViewModel);

  @override
  _RoomPageState createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage>
    with SingleTickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 2);
    super.initState();
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: NestedScrollView(
            controller:widget.roomViewModel.scrollViewController,
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  flexibleSpace: FlexibleSpaceBar(
                    background: RoomBarWidget(this.widget.roomViewModel.getRoom, this.widget.bloc),
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
              RoomPageOneWidget(this.widget.roomViewModel, this.widget.bloc),
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
              RoomPageTwoWidget(this.widget.roomViewModel, this.widget.bloc,
                  ParticipantViewModel(
                    scroll: this.widget.roomViewModel.scrollViewController,
                    user: this.widget.roomViewModel.getUser,
                    participant: Participant.withoutParameters()))
            ])));
  }
}
