// ignore_for_file: unused_local_variable, non_constant_identifier_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:post_api_k/provider/model.dart';

class Apiservice {
  // Future<NewsModel> getdata() async {
  //   var url =
  //       'https://newsapi.org/v2/everything?q=tesla&from=2022-10-26&sortBy=publishedAt&apiKey=28aa00db4ba449e3a6dc189e7f47cbed';

  //   var response = await http.get(Uri.parse(url));

  //   var result = jsonDecode(response.body);

  //   NewsModel model = NewsModel.fromJson(result);
  //   return model;
  // }

  Future<Tutormodel> Tutordata() async {
    var url =
        'http://104.248.146.26:3000/api/tutor/getClassById/61c16c82c30aec6d1aaf4d17';

    var response = await http.get(Uri.parse(url));

    var result = jsonDecode(response.body);

    Tutormodel model = Tutormodel.fromJson(result);
    return model;
  }
}
