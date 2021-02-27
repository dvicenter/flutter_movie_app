import 'package:flutter/material.dart';
import 'package:flutter_movie_app/model/media_detail.dart';

class MediaListDetail extends StatelessWidget {
  final MediaDetail _mediaDetail;

  const MediaListDetail(this._mediaDetail);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${_mediaDetail.title}',
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: '${_mediaDetail.id}',
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/no-image.jpg',
                image: _mediaDetail.getBackdropUrl(),
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200.0,
                fadeInDuration: Duration(milliseconds: 40),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _mediaDetail.title.toUpperCase(),
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                  ),
                  Divider(),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    _mediaDetail.overview,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
