
import 'package:pub/models/estabelecimento_model.dart';
import 'package:pub/models/mensagem_model.dart';
import 'package:pub/models/usuario_model.dart';

class SalaViewModel {

  enviarMensagem(Estabelecimento estabelecimento, String textoMensagem, Mensagem mensagem, Usuario usuario) {
    if (textoMensagem.isNotEmpty) {
      mensagem.setUsuario(usuario);
      mensagem.setTextoMensagem(textoMensagem);
      mensagem.setDataEnvio(DateTime.now());
    }
  }

}