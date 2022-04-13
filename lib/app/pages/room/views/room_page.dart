import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pub/app/pages/room/views/components/messages_area_widget.dart';
import 'package:pub/app/pages/user/models/user.dart';
import '../../../core/configs/app_colors.dart';
import '../../establishment/views/components/establishment_page_two_widget.dart';
import '../bloc/message_bloc.dart';
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
  // late final StreamSubscription sub;
  late final RoomViewModel instance;
  late final MessageBloc bloc;
  late TabController _tabController;
  late ScrollController _scrollViewController;

  @override
  void initState() {
    instance = RoomViewModel(room:this.widget.room,user: this.widget.user);
    bloc = MessageBloc(room:this.widget.room,user: this.widget.user);
    _scrollViewController = ScrollController(initialScrollOffset: 0.0);
    _tabController = TabController(vsync: this, length: 2);
    bloc.add(InitialEvent());
    super.initState();
  }
  @override
  void dispose() {
    instance.dispose();
    _tabController.dispose();
    _scrollViewController.dispose();
    bloc.add(DisconnectEvent());
    // sub.cancel();
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
            body: TabBarView(
                controller: _tabController, children: <Widget>[
              Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(color: Colors.white),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child:Column(
                      children: <Widget>[
                        MessagesAreaWidget(instance,this.widget.room, this.widget.user, bloc),
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
                        SafeArea(top: false,child:
                             Row(children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 4, right: 8),
                              child: TextField(
                                onEditingComplete: () {},
                                onChanged: (String value) {
                                  // if(value.length < 30) {
                                  //   instance.lineNumbers = 1;
                                  // } else if(value.length < 60){
                                  //   instance.lineNumbers = 2;
                                  // } else if(value.length < 100){
                                  //   instance.lineNumbers = 3;
                                  // } else{
                                  //   instance.lineNumbers = 5;
                                  // }
                                },
                                focusNode: this.instance.focusNode,
                                onSubmitted: (_) {
                                  this.instance.sendMessage(bloc);
                                },
                                controller: this.instance.textController,
                                autofocus: true,
                                keyboardType: TextInputType.multiline,
                                maxLines: this.instance.lineNumbers,
                                style: GoogleFonts.inter(fontSize: 15),
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.fromLTRB(20, 6, 20, 6),
                                    hintText: "Digite uma mensagem...",
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: InputBorder.none),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: SizedBox(
                              height: 48.0,
                              width: 48.0,
                              child: FloatingActionButton(
                                  backgroundColor: AppColors.brown,
                                  child: Icon(
                                    Icons.near_me_outlined,
                                    size: 29,
                                    color: Colors.white,
                                  ),
                                  mini: true,
                                  onPressed: () {
                                    this.instance.sendMessage(bloc);
                                  }
                              ),
                            ),
                          ),
                        ]
                        )
                        )
                      ])
              ),
              RoomPageTwoWidget()
            ])));
  }
}
