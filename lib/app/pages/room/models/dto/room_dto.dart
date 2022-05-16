
import 'package:pub/app/core/room_bloc/room_bloc.dart';
import 'package:pub/app/pages/room/models/room.dart';
import 'package:pub/app/pages/room/view_models/room_view_model.dart';

import '../../../participant/view_models/participant_view_model.dart';
import '../../../user/models/user.dart';

class RoomDTO {
   RoomBloc _bloc;
   RoomViewModel _roomViewModel;
   ParticipantViewModel _participantViewModel;
  get getBloc => _bloc;
  get getRoomViewModel => _roomViewModel;
  get getParticipantViewModel => _participantViewModel;

   RoomDTO({
    required RoomBloc bloc,
    required RoomViewModel roomViewModel,
    required ParticipantViewModel participantViewModel,
  })  : _bloc = bloc,
        _roomViewModel = roomViewModel,
         _participantViewModel = participantViewModel;
}

