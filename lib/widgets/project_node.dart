import 'package:flutter/material.dart';

class ProjectNode extends StatelessWidget {

  final String name;
  final String imgDir;
  final String description;
  final String linkToProject;
  final String linkToSourceCode;
  final String altText;

  const ProjectNode({Key key, this.name, this.description, this.linkToProject, this.linkToSourceCode, this.imgDir, this.altText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

List<ProjectNode> projects = [
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