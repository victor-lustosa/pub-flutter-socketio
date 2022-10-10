import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pub/app/participant/view_models/participant_view_model.dart';

import '../../../core/configs/app_colors.dart';
import '../../../core/configs/app_images.dart';
import '../../../core/configs/app_routes.dart';
import '../../../room/blocs/room_bloc.dart';
import '../../../room/models/dto/room_dto.dart';
import '../../../room/view_models/room_view_model.dart';
import 'package:google_fonts/google_fonts.dart';

class EstablishmentPageOneWidget extends StatefulWidget {
  EstablishmentPageOneWidget(
      this.roomViewModel, this.participantViewModel, this.bloc);
  final RoomBloc bloc;
  final RoomViewModel roomViewModel;
  final ParticipantViewModel participantViewModel;

  @override
  State<EstablishmentPageOneWidget> createState() =>
      _EstablishmentPageOneWidgetState();
}

class _EstablishmentPageOneWidgetState
    extends State<EstablishmentPageOneWidget> {
  late StreamSubscription mSub;
  @override
  initState() {
    mSub = widget.bloc.stream.listen((state) {
      if (state is LeavePublicRoomMessageState) this.mSub.cancel();
    });
    super.initState();
  }

  @override
  didChangeDependencies() {
    mSub = widget.bloc.stream.listen((state) {
      if (state is LeavePublicRoomMessageState) this.mSub.cancel();
    });
    super.didChangeDependencies();
  }

  @override
  dispose() {
    mSub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.darkBrown),
      child: Container(
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(10.0),
                  topRight: const Radius.circular(10.0))),
          child: BlocBuilder<RoomBloc, RoomState>(
              bloc: widget.bloc,
              buildWhen: (context, current) =>
                  context.runtimeType != current.runtimeType &&
                  (current is InitialState ||
                      current is SuccessRoomsState ||
                      current is DisconnectState ||
                      current is EnterPublicRoomMessageState ||
                      current is LeavePublicRoomMessageState),
              builder: (context, state) {
                if (state is InitialState) {
                  return Stack(
                      fit: StackFit.loose,
                      alignment: Alignment.center,
                      children: [
                        Column(children: [
                          Padding(
                              padding: EdgeInsets.only(top: 270),
                              child: Center(
                                  child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          AppColors.darkBrown))))
                        ])
                      ]);
                } else if (state is SuccessRoomsState ||
                    state is EnterPublicRoomMessageState ||
                    state is DisconnectState ||
                    state is LeavePublicRoomMessageState) {
                  return RefreshIndicator(
                      color: AppColors.darkBrown,
                      onRefresh: () async {
                        widget.bloc.add(LoadingRoomsEvent());
                      },
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: this.widget.roomViewModel.getRooms.length,
                          itemBuilder: (context, index) {
                            return Padding(
                                padding: const EdgeInsets.only(bottom: 12.0),
                                child: AnimatedBuilder(
                                    animation: this.widget.roomViewModel,
                                    builder: (context, child) {
                                      return ListTile(
                                          leading: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 25, bottom: 10),
                                              child: Container(
                                                  width: 40,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                      color: AppColors.white,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              const Radius.circular(
                                                                  5.0)),
                                                      boxShadow: [
                                                        BoxShadow(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.15),
                                                            spreadRadius: 1,
                                                            blurRadius: 3,
                                                            offset:
                                                                Offset(1, 3)),
                                                      ]),
                                                  child: this
                                                          .widget
                                                          .roomViewModel
                                                          .isAcceptedLocation(this
                                                              .widget
                                                              .roomViewModel
                                                              .getRooms[index])
                                                      ? Image.asset(
                                                          AppImages.lightLogo,
                                                          width: 20,
                                                          height: 20)
                                                      : Image.asset(
                                                          AppImages.lightUnauthorizedLogo,
                                                          width: 20,
                                                          height: 20))),
                                          title: Padding(
                                              padding: EdgeInsets.only(bottom: 10),
                                              child: this.widget.roomViewModel.isAcceptedLocation(this.widget.roomViewModel.getRooms[index])
                                                  ? Text(this.widget.roomViewModel.getRooms[index].getRoomName,
                                                      style: GoogleFonts.inter(
                                                        color: AppColors.brown,
                                                        fontSize: 18,
                                                      ))
                                                  : Text(this.widget.roomViewModel.getRooms[index].getRoomName,
                                                      style: GoogleFonts.inter(
                                                        color: Colors.grey,
                                                        fontSize: 18,
                                                      ))),
                                          subtitle: Row(
                                            children: [
                                              this
                                                          .widget
                                                          .roomViewModel
                                                          .getRooms[index]
                                                          .getParticipants
                                                          .length ==
                                                      1
                                                  ? Text(
                                                      '${this.widget.roomViewModel.getRooms[index].getParticipants.length} pessoa',
                                                      style: GoogleFonts.inter(
                                                          fontSize: 13,
                                                          color:
                                                              Colors.black45))
                                                  : Text(
                                                      '${this.widget.roomViewModel.getRooms[index].getParticipants.length} pessoas',
                                                      style: GoogleFonts.inter(
                                                          fontSize: 13,
                                                          color:
                                                              Colors.black45)),
                                              Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 40),
                                                  child: Text(
                                                      '${(this.widget.roomViewModel.getRooms[index].getDistance).toStringAsFixed(2)} km de distância',
                                                      style: GoogleFonts.inter(
                                                          fontSize: 13,
                                                          color:
                                                              Colors.black45)))
                                            ],
                                          ),
                                          onTap: () {
                                            if (this
                                                .widget
                                                .roomViewModel
                                                .isAcceptedLocation(this
                                                    .widget
                                                    .roomViewModel
                                                    .getRooms[index])) {
                                              bool isUserExist = widget
                                                  .roomViewModel
                                                  .verifyNameUser(this
                                                      .widget
                                                      .roomViewModel
                                                      .getRooms[index]);
                                              if (!isUserExist) {
                                                this
                                                    .widget
                                                    .roomViewModel
                                                    .setRoom(this
                                                        .widget
                                                        .roomViewModel
                                                        .getRooms[index]);
                                                Navigator.pushNamed(context,
                                                    AppRoutes.publicRoomRoute,
                                                    arguments: RoomDTO(
                                                        bloc: widget.bloc,
                                                        roomViewModel: this
                                                            .widget
                                                            .roomViewModel,
                                                        participantViewModel: this
                                                            .widget
                                                            .participantViewModel));
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(const SnackBar(
                                                        content: Text(
                                                            'Seu nickname já existe na sala, altere-o para entrar')));
                                              }
                                            }
                                          });
                                    }));
                          }));
                } else {
                  return Text('aconteceu um erro [Establishment_page_one]');
                }
              })),
    );
  }
}
