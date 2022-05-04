
import 'package:pub/app/core/room_bloc/room_bloc.dart';
import 'package:pub/app/pages/room/models/room.dart';
import 'package:pub/app/pages/room/view_models/room_view_model.dart';

import '../../../user/models/user.dart';
import '../../view_models/participant_view_model.dart';
import '../participant.dart';

class ParticipantDTO {
   RoomBloc _bloc;
   ParticipantViewModel _participantViewModel;

  get getBloc => _bloc;
  get getParticipantViewModel => _participantViewModel;


   ParticipantDTO({
    required RoomBloc bloc,
    required ParticipantViewModel participantViewModel
  })  : _bloc = bloc,
        _participantViewModel = participantViewModel;
}

