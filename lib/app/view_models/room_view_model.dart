
import 'package:pub/app/models/establishment.dart';
import 'package:pub/app/models/message.dart';
import 'package:pub/app/models/user.dart';

abstract class IRoomViewModel{
  enviarMensagem(Establishment estabelecimento, String textoMensagem, Message mensagem, User usuario);
}

class RoomViewModel implements IRoomViewModel{

  enviarMensagem(Establishment estabelecimento, String textoMensagem, Message mensagem, User usuario) {
    if (textoMensagem.isNotEmpty) {
      mensagem.setUsuario(usuario);
      mensagem.setTextoMensagem(textoMensagem);
      mensagem.setDataEnvio(DateTime.now());
    }
  }

}