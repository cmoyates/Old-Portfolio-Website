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

  List<Image> projectImages = [];

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < projects.length; i++) {
      projectImages.add(Image.asset(projects[i].imgDir));
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
                        SelectableText(
                          projects[index].name,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Image(
                          image: projectImages[index].image,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: SelectableText(projects[index].description),
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