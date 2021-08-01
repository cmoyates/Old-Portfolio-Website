import 'package:flutter/material.dart';
import 'package:portfolio/widgets/home_box.dart';
import 'package:portfolio/widgets/projects_box.dart';
import 'package:portfolio/widgets/project_node.dart';
import 'package:portfolio/widgets/contact_box.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  void toggleScreen(int screenNum) {
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
          containerHeight = 300;
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
        toggleScreenProjects: () => {toggleScreen(1)},
        toggleScreenContact: () => {toggleScreen(2)}
      );
      displayedWidget = homeBox;
    });
    projectsBox = ProjectsBox(
      toggleScreen: () => {toggleScreen(0)},
    );
    contactBox = ContactBox(
      toggleScreen: () => {toggleScreen(0)},
    );
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    for (var i = 0; i < projects.length; i++) {
      precacheImage(new AssetImage(projects[i].imgDir), context);
    }
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
