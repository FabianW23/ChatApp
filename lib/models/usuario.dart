import 'package:flutter/cupertino.dart';

class Usuario {
  final String uId;
  final String nombre;
  final String email;
  final bool onLine;

  Usuario(
      {@required this.uId,
      @required this.nombre,
      @required this.email,
      @required this.onLine});
}
