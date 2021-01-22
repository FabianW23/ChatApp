import 'package:flutter/material.dart';

class RButtom extends StatelessWidget {
  final String text;
  final Function onPress;

  const RButtom({Key key, @required this.text, @required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        color: Colors.blue,
        elevation: 20,
        highlightElevation: 5,
        shape: StadiumBorder(),
        onPressed: onPress,
        child: Container(
          height: 50,
          width: double.infinity,
          child: Center(
            child: Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
