import 'package:flutter/material.dart';
import 'package:flutter_movie_app/common/http_handler.dart';
import 'package:flutter_movie_app/model/media.dart';
import 'package:flutter_movie_app/ui/media_list/media_list_item.dart';

class MediaTopRated extends StatefulWidget {
  @override
  _MediaTopRatedState createState() => _MediaTopRatedState();
}

class _MediaTopRatedState extends State<MediaTopRated> {
  List<Media> _media = List();

  @override
  void initState() {
    super.initState();
    loadMovies();
  }

  void loadMovies() async {
    var movies = await HttpHandler().fecthMoviesTopRated();
    setState(() {
      _media.addAll(movies);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: _media.length,
        itemBuilder: (context, index) {
          return MediaListItem(_media[index]);
        },
      ),
    );
  }
}
