import 'package:flutter/material.dart';
import 'package:flutter_movie_app/common/http_handler.dart';
import 'package:flutter_movie_app/model/media.dart';
import 'package:flutter_movie_app/ui/media_list/media_list_detail.dart';

class MediaListItem extends StatelessWidget {
  final Media media;

  MediaListItem(this.media);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: GestureDetector(
        onTap: () async {
          var _mediaDetail = await HttpHandler().fecthMovieDetail(media.id);
          Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => MediaListDetail(_mediaDetail)));
        },
        child: Column(
          children: [
            Container(
              child: Stack(
                children: [
                  Hero(
                    tag: '${media.id}',
                    child: FadeInImage.assetNetwork(
                      placeholder: 'assets/no-image.jpg',
                      image: media.getBackdropUrl(),
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 200.0,
                      fadeInDuration: Duration(milliseconds: 40),
                    ),
                  ),
                  Positioned(
                    left: 0.0,
                    bottom: 0.0,
                    right: 0.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 10.0, top: 5.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[900].withOpacity(0.5),
                          ),
                          constraints: BoxConstraints.expand(
                            height: 55.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                media.title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 18.0,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 3.0,
                              ),
                              Text(
                                media.getGenres(),
                                style: TextStyle(
                                    fontSize: 16.0, color: Colors.white),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
