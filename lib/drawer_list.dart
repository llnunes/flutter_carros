import 'package:carros/model/usuario.dart';
import 'package:carros/pages/login_page.dart';
import 'package:carros/util/nav.dart';
import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {

  UserAccountsDrawerHeader _header(Usuario usuario) {
    print(usuario.urlFoto);

    return UserAccountsDrawerHeader(
      accountName: Text(usuario.nome),
      accountEmail: Text(usuario.email),
      currentAccountPicture: CircleAvatar(
        backgroundImage: NetworkImage(usuario.urlFoto),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    Future<Usuario> future = Usuario.get();

    return SafeArea(
      child: Drawer (
        child: ListView( // adiciona itens um em baixo do outro
          children: <Widget>[
            FutureBuilder <Usuario>(
              future: future,
              builder: (context, snapshot) {
                Usuario user = snapshot.data;
                return user != null ? _header(user) : Container();
              },
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text("Favoritos"),
              subtitle: Text("Mais informações..."),
              trailing: Icon(Icons.forward),
              onTap: () {
                print("Teste");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text("Ajuda"),
              subtitle: Text("Mais informações..."),
              trailing: Icon(Icons.forward),
              onTap: () {
                print("Teste 2");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Sair"),
              trailing: Icon(Icons.forward),
              onTap: () => _onClicklogout(context),
            ),
          ],
        ),
      ),
    );
  }

  _onClicklogout(context) {
    Usuario.clear();
    Navigator.pop(context);
    push(context, LoginPage(), replace: true);
  }
}
