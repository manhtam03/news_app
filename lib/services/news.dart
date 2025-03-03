import 'dart:convert';
import 'package:news_app/model/article_model.dart';
import 'package:http/http.dart' as http;

class News{
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url = "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=API_KEY";

    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == 'ok'){
      jsonData['articles'].forEach((element){
        if(element['urlToImage'] != null && element['description'] != null){
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            desc: element['description'],
            urlToImage: element['urlToImage'],
            url: element['url']
          );
          news.add(articleModel);
        }
      });
    }
  }
}