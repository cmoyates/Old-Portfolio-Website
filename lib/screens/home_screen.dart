import 'package:flutter/material.dart';
import 'package:portfolio/widgets/home_box.dart';
import 'package:portfolio/widgets/projects_box.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio/widgets/contact_box.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  void ToggleScreen(int screenNum) {
    setState(() {
      switch (screenNum) {
        case 0:
          containerWidth = 400;
          containerHeight = 300;
          displayedWidget = homeBox;
          break;
        case 1:
          containerWidth = 1600;
          containerHeight = 900;
          displayedWidget = projectsBox;
          break;
        case 2:
          containerWidth = 600;
          containerHeight = 900;
          displayedWidget = contactBox;
          break;
        default:
      }
    });
  }

  double containerWidth = 400;
  double containerHeight = 300;
  bool isContainerBig = false;
  HomeBox homeBox;
  ProjectsBox projectsBox;
  ContactBox contactBox;
  Widget displayedWidget;

  @override
  void initState() {
    setState(() {
      homeBox = HomeBox(
        toggleScreenProjects: () => {ToggleScreen(1)},
        toggleScreenContact: () => {ToggleScreen(2)}
      );
      displayedWidget = homeBox;
    });
    projectsBox = ProjectsBox(
      toggleScreen: () => {ToggleScreen(0)},
    );
    contactBox = ContactBox(
      toggleScreen: () => {ToggleScreen(0)},
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: AnimatedContainer(
            duration: Duration(milliseconds: 400),
            curve: Curves.easeOutCubic,
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(20),
            width: containerWidth,
            height: containerHeight,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: AnimatedSwitcher(
              duration: Duration(
                milliseconds: 100,
              ),
              child: displayedWidget,
            ),
          ),
        ));
  }
}
