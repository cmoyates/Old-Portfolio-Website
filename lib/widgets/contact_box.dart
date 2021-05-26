import 'package:flutter/material.dart';

class ContactBox extends StatelessWidget {
  ContactBox({Key key, this.toggleScreen}) : super(key: key);

  final VoidCallback toggleScreen;

  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    primary: Colors.black87,
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2.0)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Contact",
            style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          ),
          SelectableText("Email: cmoyates@gmail.com"),
          TextButton(
            style: flatButtonStyle,
            onPressed: toggleScreen, 
            child: Text("Go Back")
            )
        ],
      ),
    );
  }
}