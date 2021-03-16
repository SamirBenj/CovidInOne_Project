import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'article.dart';
import 'dart:convert';

class News {
  List<Article> news = [];

  getNews() async {
    Response<Map> response = await Dio().get(
        "https://newsapi.org/v2/everything?domains=liberation.fr&q=covid&apiKey=2587dde2cad646e9bd0c9010d42f7df5");
//https://newsapi.org/v2/everything?q=apple&from=2021-03-11&to=2021-03-11&sortBy=popularity&apiKey=2587dde2cad646e9bd0c9010d42f7df5
    Map jsonData = response.data;

    if (jsonData["status"] == 'ok') {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null) {
          if (element["publishedAt"] != null) {
            if (element["author"] != null) {
              Article article = Article(
                title: element["title"],
                author: element["author"],
                description: element["description"],
                urlToImage: element["urlToImage"],
                publishedAt: element["publishedAt"],
                content: element["content"],
              );
              news.add(article);
            }
          } //if du published
        } //if du irltoimage
      });
    }
    //debugPrint(response.data;
    debugPrint("NewsPage");
  }
}
