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