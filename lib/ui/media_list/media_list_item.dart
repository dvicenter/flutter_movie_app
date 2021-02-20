import 'package:flutter/material.dart';
import 'package:flutter_movie_app/model/media.dart';

class MediaListItem extends StatelessWidget {
  final Media media;

  MediaListItem(this.media);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          FadeInImage.assetNetwork(
            placeholder: 'assets/no-image.jpg',
            image: media.getBackdropUrl(),
            fit: BoxFit.cover,
            width: double.infinity,
            height: 200.0,
            fadeInDuration: Duration(milliseconds: 40),
          )
        ],
      ),
    );
  }
}
