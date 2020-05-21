import 'package:flutter/material.dart';
import 'package:portfolio/widgets/home_box.dart';
import 'package:portfolio/widgets/projects_box.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  void ToggleScreen() {
    setState(() {
      isContainerBig = !isContainerBig;
      if (!isContainerBig) {
        containerWidth = 400;
        containerHeight = 300;
        displayedWidget = homeBox;
      } else {
        containerWidth = 1600;
        containerHeight = 900;
        displayedWidget = projectsBox;
      }
    });
  }

  double containerWidth = 400;
  double containerHeight = 300;
  bool isContainerBig = false;
  HomeBox homeBox;
  ProjectsBox projectsBox;
  Widget displayedWidget;

  @override
  void initState() {
    setState(() {
      homeBox = HomeBox(
        toggleScreen: () => {ToggleScreen()},
      );
      displayedWidget = homeBox;
    });
    projectsBox = ProjectsBox(
      toggleScreen: () => {ToggleScreen()},
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
            curve: Curves.linearToEaseOut,
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
