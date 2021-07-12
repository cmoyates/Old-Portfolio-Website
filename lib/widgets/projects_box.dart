import 'package:flutter/material.dart';
import 'package:portfolio/widgets/project_node.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsBox extends StatefulWidget {
  final toggleScreen;

  const ProjectsBox({Key key, this.toggleScreen}) : super(key: key);

  @override
  _ProjectsBoxState createState() => _ProjectsBoxState(toggleScreen);
}

class _ProjectsBoxState extends State<ProjectsBox> {
  _ProjectsBoxState(this.toggleScreen);

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  final VoidCallback toggleScreen;

  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    primary: Colors.black87,
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2.0)),
    ),
  );

  static List<ProjectNode> projects = [
    ProjectNode(
      name: "Game and Bot",
      imgDir: "assets/images/gab.jpg",
      description: "A game and a bot to play it!\nUses PCG and Vector Field pathfinding.",
      linkToProject: "https://cmoyates.github.io/Game-and-Bot-Build/",
      linkToSourceCode: "https://github.com/cmoyates/Game-and-Bot",
    ),
    ProjectNode(
      name: "Genetic Evolution Demo",
      imgDir: "assets/images/ged.jpg",
      description: "This is a small game made with Unity that demonstrates Genetic Evolution.",
      linkToProject: "https://cmoyates.github.io/Genetic-Evolution-Demo-Build/",
      linkToSourceCode: "https://github.com/cmoyates/Genetic-Evolution-Demo",
    ),
    ProjectNode(
      name: "Portfolio Website",
      imgDir: "assets/images/pw.jpg",
      description:
          "This is my personal portfolio website.",
      altText: "You're here right now!",
      linkToSourceCode: "https://github.com/cmoyates/Portfolio-Website",
    ),
    ProjectNode(
      name: "Closet App",
      imgDir: "assets/images/ca.jpg",
      description: "This is an app made to catalog your closet and plan outfits.",
      altText: "Download the Project",
      linkToProject: "https://github.com/cmoyates/Closet-App/releases/download/v1.0/closet-app.apk",
      linkToSourceCode: "https://github.com/cmoyates/Closet-App",
    ),
    ProjectNode(
      name: "Minecraft Settlement Generator",
      imgDir: "assets/images/gdmc.jpg",
      description:
          "This is my entry into the 2021 GDMC Competition.",
      altText: "Download the Project",
      linkToProject: "https://github.com/cmoyates/Minecraft-Settlement-Generator/archive/refs/heads/main.zip",
      linkToSourceCode: "https://github.com/cmoyates/Minecraft-Settlement-Generator",
    ),
    ProjectNode(
      name: "Sorting Algorithm Visualizer",
      imgDir: "assets/images/sav.jpg",
      description:
          "This is a simple visualizer for several different sorting algorithms.",
      linkToProject: "https://sorting-algorithm-visual-e7ed1.web.app/#/",
      linkToSourceCode:
          "https://github.com/cmoyates/Sorting-Algorithm-Visualizer",
    ),
    ProjectNode(
      name: "Meme Generator",
      imgDir: "assets/images/mg.jpg",
      description:
          "This is a webapp that can be used to create and generate memes.",
      linkToProject: "https://meme-generator-bb7e7.web.app/",
      linkToSourceCode: "https://github.com/cmoyates/Meme-Generator",
    ),
  ];

  List<Image> projectImages = [];

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < projects.length; i++) {
      projectImages.add(Image.asset(projects[i].imgDir));
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    for (var i = 0; i < projectImages.length; i++) {
      precacheImage(projectImages[i].image, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Flexible(
          flex: 9,
          fit: FlexFit.tight,
          child: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: screenWidth~/400),
              itemCount: projects.length,
              itemBuilder: (context, index) {
                return Card(
                  child: GridTile(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          projects[index].name,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Image(
                          image: projectImages[index].image,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(projects[index].description),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            (projects[index].linkToProject == null) ? Flexible(flex: 1, child: Text(projects[index].altText)) : Flexible(
                              flex: 1,
                              child: TextButton(
                                style: flatButtonStyle,
                                onPressed: () async {
                                  await _launchURL(
                                      projects[index].linkToProject);
                                },
                                child: Text((projects[index].altText == null) ? "View the Project" : projects[index].altText),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: TextButton(
                                style: flatButtonStyle,
                                onPressed: () async {
                                  await _launchURL(
                                      projects[index].linkToSourceCode);
                                },
                                child: Text("View the Source Code"),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
        Flexible(
          flex: 1,
          fit: FlexFit.loose,
          child: TextButton(
              style: flatButtonStyle,
              onPressed: () {
                toggleScreen();
              },
              child: Text("Go back")),
        ),
      ],
    ));
  }
}