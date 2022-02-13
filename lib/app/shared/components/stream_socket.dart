import 'dart:async';

class StreamSocket{
  StreamSocket._();
  static final StreamSocket instance = StreamSocket._();
  final _socketResponse = StreamController<String>();

  void Function(String) get addResponse => _socketResponse.sink.add;

  Stream<String> get getResponse => _socketResponse.stream;

  void dispose(){
    _socketResponse.close();
  }
}