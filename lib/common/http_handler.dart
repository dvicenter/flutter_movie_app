import 'dart:async';
import 'dart:convert';
import 'package:flutter_movie_app/common/constants.dart';
import 'package:flutter_movie_app/model/media.dart';
import 'package:http/http.dart' as http;

final String _baseUrl = 'api.themoviedb.org';
final String _language = 'es-ES';

class HttpHandler {
  Future<dynamic> getJson(Uri uri) async {
    http.Response response = await http.get(uri);
    return json.decode(response.body);
  }

  Future<List<Media>> fecthMovies() {
    var uri = Uri.https(_baseUrl, '3/movie/popular', {
      'api_key': API_KEY,
      'page': '1',
      'language': _language,
    });

    return getJson(uri).then(
        ((data) => data['results'].map<Media>((item) => Media(item)).toList()));
  }
}
