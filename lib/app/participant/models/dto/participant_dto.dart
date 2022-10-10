import 'package:pub/app/room/blocs/room_bloc.dart';

import '../../view_models/participant_view_model.dart';

class ParticipantDTO {
  RoomBloc _bloc;
  ParticipantViewModel _participantViewModel;

  get getBloc => _bloc;
  get getParticipantViewModel => _participantViewModel;

  ParticipantDTO(
      {required RoomBloc bloc,
      required ParticipantViewModel participantViewModel})
      : _bloc = bloc,
        _participantViewModel = participantViewModel;
}
