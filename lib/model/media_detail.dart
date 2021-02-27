import 'package:flutter_movie_app/common/util.dart';

class MediaDetail {
  String backdropPath;
  // genres;
  String homepage;
  int id;
  String overview;
  double popularity;
  String posterPath;
  String releaseDate;
  int runtime;
  String status;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  String getPosterUrl() => getMediumPictureUrl(posterPath);
  String getBackdropUrl() => getLargePictureUrl(backdropPath);

  factory MediaDetail(Map jsonMap) {
    return MediaDetail.fromJson(jsonMap);
  }

  MediaDetail.fromJson(Map<String, dynamic> json) {
    backdropPath = json["backdrop_path"] ?? '';
    // genres = List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x)));
    homepage = json["homepage"] ?? '';
    id = json["id"].toInt();
    overview = json["overview"] ?? '';
    popularity = json["popularity"].toDouble();
    posterPath = json["poster_path"] ?? '';
    releaseDate = json["release_date"];
    runtime = json["runtime"] ?? 0;
    status = json["status"];
    title = json["title"];
    video = json["video"];
    voteAverage = json["vote_average"].toDouble();
    voteCount = json["vote_count"];
  }
}
