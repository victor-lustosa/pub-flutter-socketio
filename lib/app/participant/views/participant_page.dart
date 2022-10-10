import 'package:flutter/material.dart';
import 'package:pub/app/room/blocs/room_bloc.dart';

import '../../core/configs/app_colors.dart';
import '../view_models/participant_view_model.dart';
import 'components/participant_bar_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ParticipantPage extends StatefulWidget {
  final RoomBloc bloc;
  final ParticipantViewModel participantViewModel;

  ParticipantPage(this.bloc, this.participantViewModel);

  @override
  _ParticipantPageState createState() => _ParticipantPageState();
}

class _ParticipantPageState extends State<ParticipantPage> {
  late final ScrollController _scrollViewController;
  @override
  void initState() {
    // widget.bloc.add(EnterPrivateRoomEvent(widget.participantViewModel));
    _scrollViewController = ScrollController(initialScrollOffset: 0.0);
    super.initState();
  }

  @override
  void dispose() {
    // widget.bloc.add(LeaveRoomEvent());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            title: ParticipantBarWidget(
                widget.participantViewModel.getParticipant)),
        body: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(color: Colors.white),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(children: <Widget>[
              BlocBuilder<RoomBloc, RoomState>(
                  bloc: widget.bloc,
                  builder: (context, state) {
                    if (state is InitialRoomState) {
                      return Expanded(child: Container());
                    } else {
                      return Expanded(
                        child: ListView.builder(
                            controller: _scrollViewController,
                            itemCount: widget.participantViewModel
                                .getParticipant.getMessages.length,
                            itemBuilder: (context, index) {
                              return Align(
                                alignment: widget.participantViewModel
                                    .alignment(state, index),
                                child: Padding(
                                  padding: const EdgeInsets.all(6),
                                  child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      padding: const EdgeInsets.all(14),
                                      decoration: BoxDecoration(
                                          color: widget.participantViewModel
                                              .color(state, index),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8))),
                                      child: widget.participantViewModel
                                          .typeMessage(state, index)),
                                ),
                              );
                            }),
                      );
                    }
                  }),
              SafeArea(
                  top: false,
                  child: Row(children: [
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
                          focusNode: this.widget.participantViewModel.focusNode,
                          onSubmitted: (_) {
                            this
                                .widget
                                .participantViewModel
                                .sendMessage(widget.bloc);
                          },
                          controller:
                              this.widget.participantViewModel.textController,
                          autofocus: true,
                          keyboardType: TextInputType.multiline,
                          maxLines:
                              this.widget.participantViewModel.lineNumbers,
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
                              this
                                  .widget
                                  .participantViewModel
                                  .sendMessage(widget.bloc);
                            }),
                      ),
                    ),
                  ]))
            ])));
  }
}
