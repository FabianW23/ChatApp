import 'package:chatapp/pages/chat_page.dart';
import 'package:chatapp/pages/loading_page.dart';
import 'package:chatapp/pages/login_page.dart';
import 'package:chatapp/pages/register_page.dart';
import 'package:chatapp/pages/users_page.dart';
import 'package:flutter/material.dart';

final Map<String, Widget Function(BuildContext)> myRoutes = {
  "chat": (_) => ChatPage(),
  "loading": (_) => LoadingPage(),
  "login": (_) => LoginPage(),
  "register": (_) => RegisterPage(),
  "users": (_) => UsersPage(),
};
