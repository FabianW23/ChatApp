import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final String titulo;

  const Logo({Key key, @required this.titulo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        padding: EdgeInsets.only(top: 40),
        width: 200,
        child: Column(
          children: [
            Image(image: AssetImage("assets/tag-logo.png")),
            SizedBox(height: 20),
            Text(
              this.titulo,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
