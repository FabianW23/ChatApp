import 'package:chatapp/widgets/Login_labels.dart';
import 'package:chatapp/widgets/custom_RButtom.dart';
import 'package:chatapp/widgets/custom_input.dart';
import 'package:chatapp/widgets/custom_logo.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Logo(
                  titulo: "Messenger",
                ),
                _InPuts(),
                Labels(
                  titulo: "No tienes cuenta",
                  subtitulo: "Crea una!",
                  route: "register",
                ),
                Text("Terminos y condiciones de uso")
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _InPuts extends StatefulWidget {
  @override
  __InPutsState createState() => __InPutsState();
}

class __InPutsState extends State<_InPuts> {
  final emailController = new TextEditingController();
  final passController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          CustomInput(
            hintText: "Email",
            icon: Icon(Icons.email_outlined),
            controller: emailController,
            inputType: TextInputType.emailAddress,
          ),
          CustomPassword(
            hintText: "Password",
            icon: Icon(Icons.lock),
            controller: passController,
            inputType: TextInputType.visiblePassword,
          ),
          RButtom(
              text: "Enviar",
              onPress: () {
                print(passController.text);
              })
        ],
      ),
    );
  }
}
