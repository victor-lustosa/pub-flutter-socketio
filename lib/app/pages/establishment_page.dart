import 'package:pub/app/config/app_colors.dart';
import 'package:pub/app/config/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pub/app/models/user.dart';
import 'package:pub/app/pages/room_page.dart';
import 'package:pub/app/repositories/establishment_repository.dart';
import 'package:pub/app/view_models/establishment_view_model.dart';
import '../widgets/bar_widgets/establishment_bar_widget.dart';
import 'package:dio/dio.dart';
class EstabelecimentoPage extends StatefulWidget {
  User usuario;
  String latitude;
  String longitude;

  EstabelecimentoPage({required this.usuario, required this.latitude, required this.longitude });
  @override
  _EstabelecimentoPageState createState() => _EstabelecimentoPageState();

}

class _EstabelecimentoPageState extends State<EstabelecimentoPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  EstablishmentViewModel _estabelecimentoViewModel = EstablishmentViewModel(DioEstablishmentRepository(Dio()));
  late List<dynamic> _estabelecimentos;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: 2,
        vsync: this
    );
  }

  @override
  Widget build (BuildContext context) {
    return Scaffold(
        appBar: EstablishmentBarWidget(
            this.widget.usuario.getNickname,
            this._tabController
        ),
        body: SingleChildScrollView(
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColors.white
                ),
                child: Column(
                    children: [
                      SizedBox(
                          child: FutureBuilder<List<dynamic>>(
                              future: _estabelecimentoViewModel.listaEstabelecimentos('-10.257615194551102','-48.325213882543736'),
                              initialData: [],
                              builder: (context, AsyncSnapshot<List<dynamic>> snapshot){
                                switch(snapshot.connectionState) {
                                  case ConnectionState.none:
                                    break;
                                  case ConnectionState.waiting:
                                    return Padding(
                                        padding: EdgeInsets.only(top: 30),
                                        child: Container(
                                            child: Center(
                                                child: CircularProgressIndicator(
                                                    valueColor: new AlwaysStoppedAnimation<Color>(
                                                        AppColors.marromEscuro)
                                                )
                                            )
                                        )
                                    );
                                  case ConnectionState.active:
                                    break;
                                  case ConnectionState.done:
                                    if (!snapshot.hasData) {
                                      return Padding(
                                          padding: EdgeInsets.only(top: 30),
                                          child: Container(
                                              child: Center(
                                                  child: CircularProgressIndicator(
                                                      valueColor: new AlwaysStoppedAnimation<Color>(
                                                          AppColors.marromEscuro)
                                                  )
                                              )
                                          )
                                      );
                                    }
                                    _estabelecimentos = snapshot.data!;
                                    return   ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        itemCount: snapshot.data!.length ,
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                              leading: Padding(
                                                  padding: EdgeInsets.only(left: 25) ,
                                                  child: Icon(
                                                      Icons.location_on,size: 29,
                                                      color: AppColors.corIconeEstabelecimento)
                                              ),
                                              title: Padding(
                                                  padding: EdgeInsets.only(left: 5,) ,
                                                  child: Text(
                                                      _estabelecimentos[index].getNome,
                                                      style: AppTextStyles.fonteLista)
                                              ),
                                              onTap: () {

                                                Navigator.push( context,
                                                    MaterialPageRoute( builder:
                                                        (context) => RoomPage(
                                                        establishment: _estabelecimentos[index],
                                                        usuario: this.widget.usuario)
                                                    )
                                                );
                                              }
                                          );
                                        }
                                    );
                                }
                                return Text('Unkown error');
                              }
                          )
                      )
                    ]
                )
            )
        ),
        floatingActionButton: SizedBox(
            height: 32,
            width: 136,
            child: FloatingActionButton.extended(
                onPressed: () {},
                label: Text("Visão em mapa",
                    style:GoogleFonts.inter(
                        fontSize: 10.5,color: Colors.white)
                ),
                backgroundColor: AppColors.marromClaro,
                icon: Icon(
                    Icons.map,size: 15,
                    color: Colors.white)
            )
        )
    );
  }
}