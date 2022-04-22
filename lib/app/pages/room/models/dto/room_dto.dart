
import 'package:pub/app/core/room_bloc/room_bloc.dart';
import 'package:pub/app/pages/room/models/room.dart';
import 'package:pub/app/pages/room/view_models/room_view_model.dart';

import '../../../user/models/user.dart';

class RoomDTO {
  late User _user;
  late Room _room;
  late RoomBloc _bloc;
  late RoomViewModel _roomViewModel;

  get getBloc => _bloc;

  get getUser => _user;

  get getRoom => _room;

  get getRoomViewModel => _roomViewModel;

}

