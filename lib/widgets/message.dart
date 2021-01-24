import 'package:flutter/material.dart';

class ChatMesagge extends StatelessWidget {
  final String text;
  final String uId;
  final AnimationController animationController;

  ChatMesagge(
      {@required this.text,
      @required this.uId,
      @required this.animationController});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: (uId == "123") ? _myMessage(context) : _noMyMessage(context),
    );
  }

  Widget _myMessage(context) {
    return FadeTransition(
      opacity: animationController,
      child: SizeTransition(
        sizeFactor: CurvedAnimation(
            parent: animationController, curve: Curves.easeInOut),
        child: Align(
          alignment: Alignment.centerRight,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.indigo[200]),
            padding: EdgeInsets.all(7.0),
            margin: EdgeInsets.only(
                right: 5,
                left: MediaQuery.of(context).size.width * 0.2,
                bottom: 5),
            child: Text(text),
          ),
        ),
      ),
    );
  }

  _noMyMessage(context) {
    return FadeTransition(
      opacity: animationController,
      child: SizeTransition(
        sizeFactor: CurvedAnimation(
            parent: animationController, curve: Curves.easeInOut),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.blueGrey[200]),
            padding: EdgeInsets.all(7.0),
            margin: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.2,
                left: 5,
                bottom: 5),
            child: Text(text),
          ),
        ),
      ),
    );
  }
}
