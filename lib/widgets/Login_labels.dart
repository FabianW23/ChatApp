import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  final String route;
  final String titulo;
  final String subtitulo;

  const Labels(
      {Key key,
      @required this.route,
      @required this.titulo,
      @required this.subtitulo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            titulo,
            style: TextStyle(fontSize: 15),
          ),
          GestureDetector(
            child: Text(
              subtitulo,
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.pushNamed(context, this.route);
            },
          )
        ],
      ),
    );
  }
}
