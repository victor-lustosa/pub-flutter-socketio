
import 'package:pub/app/core/room_bloc/room_bloc.dart';
import 'package:pub/app/pages/room/models/room.dart';
import 'package:pub/app/pages/room/view_models/room_view_model.dart';

import '../../../user/models/user.dart';

class ParticipantDTO {
   RoomBloc _bloc;
   RoomViewModel _roomViewModel;

  get getBloc => _bloc;
  get getRoomViewModel => _roomViewModel;

   ParticipantDTO({
    required RoomBloc bloc,
    required RoomViewModel roomViewModel,
  })  : _bloc = bloc,
        _roomViewModel = roomViewModel;
}

