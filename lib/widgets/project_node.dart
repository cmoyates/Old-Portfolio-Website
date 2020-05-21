import 'package:flutter/material.dart';

class ProjectNode extends StatelessWidget {

  final String name;
  final String imgDir;
  final String description;
  final String linkToProject;
  final String linkToSourceCode;

  const ProjectNode({Key key, this.name, this.description, this.linkToProject, this.linkToSourceCode, this.imgDir}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}