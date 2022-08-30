import 'package:flutter/material.dart';
import 'package:newsapi/model/Article.dart';
import 'package:newsapi/widgets/NewsCardWidgets.dart';

class NewsDescriptionPage extends StatelessWidget {
  final Article data;
  const NewsDescriptionPage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NewsCardWidgets(article: data),
    );
  }
}
