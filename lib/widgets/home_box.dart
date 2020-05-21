import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeBox extends StatelessWidget {

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  final VoidCallback toggleScreen;

  HomeBox({this.toggleScreen});
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          "Hi, my name is Cris.",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              color: Colors.white,
              onPressed: () async {
                toggleScreen();
              },
              child: Text("Projects"),
            ),
            RaisedButton(
              color: Colors.white,
              onPressed: () {
                _launchURL("https://github.com/cmoyates");
              },
              child: Text("Github"),
            ),
            RaisedButton(
              color: Colors.white,
              onPressed: () {
                
              },
              child: Text("Contact"),
            ),
          ],
        ),
      ],
    );
  }
}
