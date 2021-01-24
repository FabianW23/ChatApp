import 'package:chatapp/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Material App",
      initialRoute: "chat",
      routes: myRoutes,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Main"),
        ),
        body: Center(child: Container(child: Text("Hola Mundo"))),
      ),
    );
  }
}
