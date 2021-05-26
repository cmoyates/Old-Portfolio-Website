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

  final VoidCallback toggleScreenProjects;
  final VoidCallback toggleScreenContact;

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.black87,
    primary: Colors.white,
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );

  HomeBox({this.toggleScreenProjects, this.toggleScreenContact});
  
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
            ElevatedButton(
              style: raisedButtonStyle,
              onPressed: () async {
                toggleScreenProjects();
              },
              child: Text("Projects")
            ),
            ElevatedButton(
              style: raisedButtonStyle,
              onPressed: () {
                _launchURL("https://github.com/cmoyates");
              },
              child: Text("Github"),
            ),
            ElevatedButton(
              style: raisedButtonStyle,
              onPressed: () {
                toggleScreenContact();
              },
              child: Text("Contact"),
            ),
          ],
        ),
      ],
    );
  }
}
