import 'package:flutter_movie_app/common/util.dart';

class Media {
  int id;
  double voteAverage;
  String title;
  String posterPath;
  String backdropPath;
  String overview;
  String releaseDate;
  List<dynamic> genreIds;

  String getPosterUrl() => getMediumPictureUrl(posterPath);
  String getBackdropUrl() => getLargePictureUrl(backdropPath);

  factory Media(Map jsonMap) {
    return Media.fromJson(jsonMap);
  }

  Media.fromJson(Map<String, dynamic> json) {
    id = json['id'].toInt();
    voteAverage = json['vote_average'].toDouble();
    title = json['title'];
    posterPath = json['poster_path'];
    backdropPath = json['backdrop_path'];
    overview = json['overview'];
    releaseDate = json['release_date'];
    genreIds = json['genre_ids'].cast<int>();
  }
}
