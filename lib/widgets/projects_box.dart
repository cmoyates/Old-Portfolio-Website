import 'package:flutter/material.dart';
import 'package:portfolio/widgets/project_node.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsBox extends StatelessWidget {
  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  final VoidCallback toggleScreen;

  const ProjectsBox({Key key, this.toggleScreen}) : super(key: key);

  static List<ProjectNode> projects = [
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

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Flexible(
          flex: 9,
          fit: FlexFit.tight,
          child: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
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
                          image: AssetImage(projects[index].imgDir),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(projects[index].description),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Flexible(
                              flex: 1,
                              child: FlatButton(
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                onPressed: () async {
                                  await _launchURL(
                                      projects[index].linkToProject);
                                },
                                child: Text("View the Project"),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: FlatButton(
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
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
          fit: FlexFit.tight,
          child: FlatButton(
              onPressed: () {
                toggleScreen();
              },
              child: Text("Go back")),
        ),
      ],
    ));
  }
}
