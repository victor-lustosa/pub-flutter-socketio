import 'package:pub/config/app_text_styles.dart';
import 'package:pub/models/estabelecimento.dart';
import 'package:flutter/material.dart';
import 'package:pub/models/sala.dart';
import 'package:pub/models/usuario.dart';
import 'package:pub/services/crud_service.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dio/dio.dart';
import 'package:pub/widget/app_bar/home_estabelecimentos_bar_widget.dart';
import 'package:pub/widget/portrait_mode_mixin.dart';

class ListaEstabelecimentos extends StatefulWidget {
  Usuario usuario;
  String latitude;
  String longitude;

  ListaEstabelecimentos({required this.usuario, required this.latitude, required this.longitude });
  @override
  _ListaEstabelecimentosState createState() => _ListaEstabelecimentosState();
}

class _ListaEstabelecimentosState extends State<ListaEstabelecimentos> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  CrudService crud = CrudService();
  List<Estabelecimento> listaEstabelecimentos = [];
  Sala sala = Sala();
  Dio dio = Dio();
  late String latitude;
  late String longitude;
  late Response response;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: 2,
        vsync: this
    );
  }
  Future<List<Estabelecimento>> buscaAllDados() async {
    latitude = this.widget.latitude;
    longitude = this.widget.longitude;

    dio.options.headers['content-Type'] = 'application/json, charset=utf-8';
    var response = await dio.get('https://pubapi-django.herokuapp.com/pubapi/estabelecimentos/${latitude}/${longitude}');
    List lista = response.data;
    listaEstabelecimentos = lista.map((model) => Estabelecimento.with_JSON(model)).toList();
    return listaEstabelecimentos;
  }

  @override
  Widget build (BuildContext context) {

    return  Material(
        child:SingleChildScrollView(
            child:Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(color:  Color(0xFF422600)),
                child: Column(
                    children: [
                      HomeEstabelecimentosBarWidget(this.widget.usuario.getNome),
                      Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.only(topRight:Radius.circular(17),topLeft:Radius.circular(17))),
                          height: 728,
                          width: double.maxFinite,
                          child: Stack(
                              children: <Widget> [
                                 TabBar(

                                  indicatorWeight: 4,
                                   labelStyle: AppTextStyles.tabsSelecionadas,  //For Selected tab
                                   unselectedLabelStyle: AppTextStyles.tabsNaoSelecionadas,
                                  controller: _tabController,
                                  indicatorColor: Colors.white,
                                   labelColor: Color(0xFF422600),
                                   unselectedLabelColor: Colors.grey,
                                  tabs: <Widget>[
                                    Tab(text: "Salas disponíveis", ),
                                    Tab(text: "Salas privadas",)
                                  ],
                                ),
                                Column(
                                    children: <Widget> [
                                      Padding( padding: EdgeInsets.only(bottom: 20)),
                                      Expanded(
                                          child: SizedBox( child:  FutureBuilder<List<Estabelecimento>>(
                                              future:buscaAllDados(),
                                              initialData: [],
                                              builder: (context, AsyncSnapshot<List<Estabelecimento>>   snapshot){
                                                final List<Estabelecimento>? estabelecimentos = snapshot.data;
                                                switch(snapshot.connectionState) {
                                                  case ConnectionState.none:
                                                    break;
                                                  case ConnectionState.waiting:
                                                    return Container(
                                                        child: Center(
                                                          child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Color(0xFF422600)),),
                                                        ));
                                                    break;
                                                  case ConnectionState.active:
                                                    break;
                                                  case ConnectionState.done:
                                                    if (!snapshot.hasData) {
                                                      return Padding(padding: EdgeInsets.only(top: 280),child:Container(
                                                          child: Center(
                                                            child: CircularProgressIndicator(  valueColor: new AlwaysStoppedAnimation<Color>(Color(0xFF422600)),),
                                                          )),
                                                      );
                                                    }
                                                    return   ListView.builder(
                                                        scrollDirection: Axis.vertical,
                                                        shrinkWrap: true,
                                                        itemCount:  snapshot.data!.length , itemBuilder: (context,index) {
                                                      return ListTile(
                                                          leading: Padding(padding: EdgeInsets.only(left: 25,) ,child: Icon(Icons.location_on,size: 31, color: Color(0xFFDE6B6B))),
                                                          title: Padding(padding: EdgeInsets.only(left: 5,) ,child:Text(estabelecimentos![index].getNome,style: AppTextStyles.fonteLista,)),
                                                          onTap: () {
                                                            // Navigator.push(context, MaterialPageRoute(builder: (context) => Sala(estabelecimento:estabelecimentos![index]),),);
                                                          });}
                                                    );
                                                    break;
                                                }
                                                return Text('Unkown error');
                                              }))),
                                      Padding(
                                        padding: EdgeInsets.only(top: 0),
                                        child: Row( children: <Widget> [
                                          Padding(
                                              padding: EdgeInsets.only(bottom: 0, right: 20),child: ElevatedButton.icon(
                                            onPressed: () {},
                                            label: Text("Visão em mapa",style:GoogleFonts.quantico(fontSize: 13,color: Colors.white)),
                                            style: ButtonStyle(
                                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(18.0),
                                                  )),
                                              backgroundColor: MaterialStateProperty.all(Color(0xFFB87333)),
                                              padding:MaterialStateProperty.all( EdgeInsets.symmetric(horizontal: 20)),

                                            ), icon: Icon(Icons.map,size: 15, color: Colors.white),)),],
                                          mainAxisAlignment: MainAxisAlignment.end, ),),
                                    ]),
                              ]))]))));

  }
}
