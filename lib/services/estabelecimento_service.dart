import 'dart:convert';

import 'package:http/http.dart' as http;
const baseUrl ='http://10.0.2.2:8000';
class EstabelecimentoService{

  static Future getEstabelecimentos() async{
    return await http.get(Uri.parse( baseUrl + '/pubapi/estabelecimentos/-10.181149910630188/-48.3375692306857'),
      headers: { 'Content-type': 'application/json; charset=utf-8',},
     );
  }
}