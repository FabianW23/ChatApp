import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String hintText;
  final Icon icon;
  final TextEditingController controller;
  final TextInputType inputType;

  const CustomInput({
    Key key,
    @required this.hintText,
    @required this.icon,
    @required this.controller,
    this.inputType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.only(top: 5, right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black12, offset: Offset(3, 10), blurRadius: 10),
          ],
        ),
        child: TextField(
          controller: controller,
          obscureText: false,
          keyboardType: inputType,
          decoration: InputDecoration(
              prefixIcon: icon, hintText: hintText, border: InputBorder.none),
        ));
  }
}

class CustomPassword extends StatefulWidget {
  final String hintText;
  final Icon icon;
  final TextEditingController controller;
  final TextInputType inputType;
  final bool isPassword = true;

  const CustomPassword({
    Key key,
    this.hintText,
    this.icon,
    this.controller,
    this.inputType,
  }) : super(key: key);

  @override
  _CustomPasswordState createState() => _CustomPasswordState(
        "Password",
        Icon(Icons.lock),
        this.controller,
        TextInputType.visiblePassword,
        true,
      );
}

class _CustomPasswordState extends State<CustomPassword> {
  final String hintText;
  final Icon icon;
  final TextEditingController controller;
  final TextInputType inputType;
  bool isPassword;

  _CustomPasswordState(this.hintText, this.icon, this.controller,
      this.inputType, this.isPassword);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.only(top: 5, right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black12, offset: Offset(3, 10), blurRadius: 10),
          ],
        ),
        child: TextField(
          controller: controller,
          obscureText: isPassword,
          keyboardType: inputType,
          decoration: InputDecoration(
              prefixIcon: icon,
              hintText: hintText,
              border: InputBorder.none,
              suffixIcon: IconButton(
                splashRadius: 10,
                icon:
                    Icon(isPassword ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    this.isPassword = !isPassword;
                  });
                },
              )),
        ));
  }
}
