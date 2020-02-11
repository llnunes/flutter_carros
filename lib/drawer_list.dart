import 'package:carros/pages/login_page.dart';
import 'package:carros/util/nav.dart';
import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer (
        child: ListView( // adiciona itens um em baixo do outro
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Lucas"),
              accountEmail: Text("email@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/images/dog1.jpg"),
              ),
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
    Navigator.pop(context);
    push(context, LoginPage(), replace: true);
  }
}
