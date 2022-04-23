
import 'package:pub/app/core/room_bloc/room_bloc.dart';
import 'package:pub/app/pages/room/models/room.dart';
import 'package:pub/app/pages/room/view_models/room_view_model.dart';

import '../../../user/models/user.dart';

class RoomDTO {
   User _user;
   Room _room;
   RoomBloc _bloc;
   RoomViewModel _roomViewModel;

  get getBloc => _bloc;

  get getUser => _user;

  get getRoom => _room;

  get getRoomViewModel => _roomViewModel;

   RoomDTO({
    required User user,
    required Room room,
    required RoomBloc bloc,
    required RoomViewModel roomViewModel,
  })  : _user = user,
        _room = room,
        _bloc = bloc,
        _roomViewModel = roomViewModel;
}

