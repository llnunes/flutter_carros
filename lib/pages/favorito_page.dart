import 'package:carros/bloc/FavoritosBloc.dart';
import 'package:carros/model/carro.dart';
import 'package:carros/pages/carros/carros_listview.dart';
import 'package:carros/widgets/text_error.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritosPage extends StatefulWidget {
  @override
  _FavoritosPageState createState() => _FavoritosPageState();
}

class _FavoritosPageState extends State<FavoritosPage>
    with AutomaticKeepAliveClientMixin<FavoritosPage> {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Provider.of<FavoritosBloc>(context, listen: false).fetch();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return StreamBuilder(
      stream: Provider.of<FavoritosBloc>(context).stream,
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
    return Provider.of<FavoritosBloc>(context).fetch();
  }

// NÃO FAZ DISPOSE DE BLOC GLOBAL
//  @override
//  void dispose() {
//    super.dispose();
//    favoritosBloc.dispose();
//  }
}
