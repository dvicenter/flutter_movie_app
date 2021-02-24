import 'package:flutter/material.dart';
import 'package:flutter_movie_app/common/http_handler.dart';
import 'package:flutter_movie_app/model/media.dart';
import 'package:flutter_movie_app/ui/media_list/media_list_item.dart';

class MediaUpcoming extends StatefulWidget {
  @override
  _MediaUpcomingState createState() => _MediaUpcomingState();
}

class _MediaUpcomingState extends State<MediaUpcoming> {
  List<Media> _media = List();

  @override
  void initState() {
    super.initState();
    loadMovies();
  }

  void loadMovies() async {
    var movies = await HttpHandler().fecthMoviesUpcoming();
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
