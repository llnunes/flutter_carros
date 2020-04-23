import 'package:carros/bloc/CarroBloc.dart';
import 'package:carros/bloc/FavoritosBloc.dart';
import 'package:carros/model/carro.dart';
import 'package:carros/pages/carros_listview.dart';
import 'package:carros/widgets/text_error.dart';
import 'package:flutter/material.dart';

class FavoritosPage extends StatefulWidget {
  @override
  _FavoritosPageState createState() => _FavoritosPageState();
}

class _FavoritosPageState extends State<FavoritosPage>
    with AutomaticKeepAliveClientMixin<FavoritosPage> {

  final _bloc = FavoritosBloc();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bloc.fetch();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return StreamBuilder(
      stream: _bloc.stream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return TextError("Não foi possivel recuperar os carros");
        }
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        List<Carro> carros = snapshot.data;
        return RefreshIndicator(
          onRefresh: _onRefresh,
          child: CarrosListView(carros),
        );
      },
    );
  }

  Future<void> _onRefresh() {
    return _bloc.fetch();
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }

}
