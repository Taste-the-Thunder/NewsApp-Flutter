import 'dart:convert';

import 'package:http/http.dart';
import 'package:newsapi/model/Article.dart';

class ApiService{

  final endPoint = "https://newsapi.org/v2/everything?q=tesla&from=2022-07-27&sortBy=publishedAt&apiKey=27aafa002a324c3fb9d80fe2f2c69977";
  Future<List<Article>> getArticle() async{
      Response response = await get(Uri.parse(endPoint));
      if(response.statusCode == 200){

        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json['articles'];
        List<Article> articles = body.map((dynamic item) => Article.fromJson(item)).toList();
        return articles;

      } else {
        throw 'Data not fount';
      }
  }
}