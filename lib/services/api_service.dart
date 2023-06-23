import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/webtoon_model.dart';

class ApiService {
  final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  final String today = "today";

  Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonList = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url); // GET방식
    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var e in webtoons) {
        webtoonList.add(WebtoonModel.fromJson(e));
      }
      return webtoonList;
    }
    throw Error();
  }
}
