import 'package:flutter/material.dart';
import 'package:pub/models/estabelecimento.dart';
import 'package:pub/models/sala.dart';

class RoomScreen extends StatefulWidget {
  late Sala sala;
  Estabelecimento estabelecimento;

  RoomScreen({required this.estabelecimento });
  @override
  _RoomScreenState createState() => _RoomScreenState();
}
class _RoomScreenState extends State<RoomScreen>  {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}