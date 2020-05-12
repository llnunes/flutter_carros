import 'package:cached_network_image/cached_network_image.dart';
import 'package:carros/api/api_response.dart';
import 'package:carros/api/carros_api.dart';
import 'package:carros/api/loripsum_api.dart';
import 'package:carros/model/carro.dart';
import 'package:carros/pages/carros/carros_form_page.dart';
import 'package:carros/service/favorito_service.dart';
import 'package:carros/util/alert.dart';
import 'package:carros/util/nav.dart';
import 'package:carros/util/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CarroPage extends StatefulWidget {
  final Carro carro;

  CarroPage(this.carro);

  @override
  _CarroPageState createState() => _CarroPageState();
}

class _CarroPageState extends State<CarroPage> {
  final _loripsumApiBloc = LoripsumBloc();

  Color color = Colors.grey;

  Carro get carro => widget.carro;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    FavoritoService.isFavorito(carro).then((favorito) {
      setState(() {
        color = favorito ? Colors.red : Colors.grey;
      });
    });

    _loripsumApiBloc.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.carro.nome),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.place),
            onPressed: _onClickMap,
          ),
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: _onClickVideo,
          ),
          PopupMenuButton<String>(
            onSelected: _onClickPopupMenu,
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  value: "Editar",
                  child: Text("Editar"),
                ),
                PopupMenuItem(
                  value: "Deletar",
                  child: Text("Deletar"),
                ),
                PopupMenuItem(
                  value: "Share",
                  child: Text("Share"),
                ),
              ];
            },
          )
        ],
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView(
        children: <Widget>[
          CachedNetworkImage(
              imageUrl: widget.carro.urlFoto ??
                  "http://www.livroandroid.com.br/livro/carros/classicos/Dodge_Challenger.png"),
          _bloco1(),
          Divider(),
          _bloco2()
        ],
      ),
    );
  }

  Row _bloco1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            text(widget.carro.nome, fontSize: 22, bold: true),
            text(widget.carro.tipo, fontSize: 16, bold: false),
          ],
        ),
        Row(
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.favorite,
                color: color,
                size: 40,
              ),
              onPressed: _onClickFavorito,
            ),
            IconButton(
              icon: Icon(
                Icons.share,
                size: 40,
              ),
              onPressed: _onClickShare,
            )
          ],
        )
      ],
    );
  }

  _bloco2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        text(widget.carro.descricao, fontSize: 16, bold: true),
        SizedBox(
          height: 20,
        ),
        StreamBuilder<String>(
          stream: _loripsumApiBloc.stream,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            }
            return text(snapshot.data, fontSize: 16);
          },
        ),
      ],
    );
  }

  void _onClickMap() {}

  void _onClickVideo() {}

  _onClickPopupMenu(String value) {
    switch (value) {
      case "Editar":
        print("editar");
        push(context, CarroFormPage(carro: carro));
        break;
      case "Deletar":
        print("deletar");
        deletar();
        break;
      case "Share":
        print("share");
        break;
    }
  }

  void _onClickShare() {}

  void _onClickFavorito() async {
    bool favorito = await FavoritoService.favoritar(carro);

    setState(() {
      color = favorito ? Colors.red : Colors.grey;
    });
  }


  void deletar() async {
    ApiResponse<bool> response = await CarrosApi.delete(carro);

    if(response.ok) {
      alert(context, "Alerta", "Carro deletado com sucesso", callback: () {
        pop(context);
      });
    } else {
      alert(context, "Problema", response.msg);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _loripsumApiBloc.dispose();
  }

}
