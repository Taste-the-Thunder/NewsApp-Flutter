import 'package:flutter/material.dart';
import 'package:newsapi/NewsDescriptionPage.dart';
import 'package:newsapi/model/Article.dart';
import 'package:newsapi/service/api_service.dart';
import 'package:newsapi/widgets/NewsCardWidgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ApiService apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News API'),
      ),
      body: FutureBuilder(
        future: apiService.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot ){
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, index){
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(
                          builder: (BuildContext context) => NewsDescriptionPage(data: snapshot.data![index]))
                      );
                    },
                      child: NewsCardWidgets(
                          article: snapshot.data![index]
                      )
                  );
              }
            );
          }
          return Center(
              child: CircularProgressIndicator()
          );
        }
      )
    );
  }
}
