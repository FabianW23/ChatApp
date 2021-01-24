import 'dart:io';

import 'package:chatapp/widgets/message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final _mssController = new TextEditingController();
  final _focusNode = new FocusNode();
  bool writting = false;
  //l
  final List<ChatMesagge> _messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Laura Lopez"),
        centerTitle: true,
        elevation: 5,
      ),
      body: Container(
          child: Column(
        children: [
          Flexible(
              child: ListView.builder(
            itemBuilder: (_, i) => _messages[i],
            itemCount: _messages.length,
            reverse: true,
          )),
          //Divider(height: 1,),
          Container(
            height: 50,
            //margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 12,
                      blurRadius: 10,
                      offset: Offset(0, 10))
                ],
                borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(15), topEnd: Radius.circular(15)),
                color: Colors.white),

            child: _inputChat(),
          )
        ],
      )),
    );
  }

  Widget _inputChat() {
    return SafeArea(
        child: Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Flexible(
              child: TextField(
            controller: _mssController,
            onSubmitted: (_) {},
            onChanged: (String texto) {
              if (texto.length != 0) {
                writting = true;
              } else {
                writting = false;
              }
              setState(() {});
            },
            decoration: InputDecoration.collapsed(hintText: "Escribir mensaje"),
            focusNode: _focusNode,
          )),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: Platform.isAndroid ? _sendAndroid() : _sendIos())
        ],
      ),
    ));
  }

  Widget _sendAndroid() {
    return IconTheme(
      data: IconThemeData(color: Colors.blue[300]),
      child: IconButton(
        icon: Icon(Icons.send),
        onPressed: writting ? () => _sendbutton() : null,
      ),
    );
  }

  Widget _sendIos() {
    return CupertinoButton(
        child: Text("Enviar"),
        onPressed: writting ? () => _sendbutton() : null);
  }

  _sendbutton() {
    final String text = _mssController.text;
    _mssController.clear();
    _focusNode.requestFocus();
    final message = new ChatMesagge(
        text: text,
        uId: "1233",
        animationController: AnimationController(
            vsync: this, duration: Duration(milliseconds: 400)));
    _messages.insert(0, message);
    message.animationController.forward();
    setState(() {
      writting = false;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    for (ChatMesagge message in _messages) {
      message.animationController.dispose();
    }
    super.dispose();
  }
}
