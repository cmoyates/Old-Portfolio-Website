import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectableText("Email:    cmoyates@gmail.com"),
              SelectableText.rich(
                TextSpan(
                  children: [
                    TextSpan(text: "LinkedIn: "),
                    TextSpan(
                        text: "https://www.linkedin.com/in/cristopher-yates/",
                        mouseCursor: SystemMouseCursors.click,
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () async {
                          var url = "https://www.linkedin.com/in/cristopher-yates/";
                          if (await canLaunch(url)) {
                            launch(url);
                          }
                          else {
                            throw "Could not load $url";
                          }
                        },
                      )
                  ]
                )
              ),
            ]
          ),
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