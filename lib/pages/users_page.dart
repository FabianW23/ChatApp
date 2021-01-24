import 'package:chatapp/models/usuario.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter/material.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key key}) : super(key: key);

  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  final usuarios = [
    Usuario(
        uId: "1", nombre: "Oscar", email: "test1@yopmail.com", onLine: false),
    Usuario(
        uId: "2", nombre: "Andres", email: "test2@yopmail.com", onLine: true),
    Usuario(uId: "3", nombre: "Sara", email: "test3@yopmail.com", onLine: true),
  ];

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.logout),
          title: Center(child: Text("Nombre")),
          actions: [
            Icon(Icons.cloud_done_rounded),
            SizedBox(
              width: 15,
            )
          ],
        ),
        body: SmartRefresher(
            controller: _refreshController,
            enablePullDown: true,
            onRefresh: _onRefresh,
            header: WaterDropHeader(
              complete: Icon(Icons.check, color: Colors.blue),
              waterDropColor: Colors.blue,
            ),
            child: _listView()));
  }

  ListView _listView() {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (_, i) => _listTile(usuarios[i]),
      separatorBuilder: (_, i) => Divider(),
      itemCount: usuarios.length,
    );
  }

  ListTile _listTile(Usuario usuario) {
    return ListTile(
      leading: Icon(Icons.online_prediction_outlined),
      title: Text(usuario.nombre),
      trailing: Container(
        decoration: BoxDecoration(boxShadow: <BoxShadow>[
          BoxShadow(
              color: usuario.onLine ? Colors.green[300] : Colors.red[300],
              blurRadius: 5,
              spreadRadius: 0.5)
        ]),
        child: Icon(
          Icons.lens_rounded,
          size: 12,
          color: usuario.onLine ? Colors.green : Colors.red,
        ),
      ),
    );
  }
}
