import 'package:flutter/material.dart';
import 'package:flutter_movie_app/model/media_detail.dart';
import 'package:flutter_movie_app/model/media_video.dart';
import 'package:flutter_movie_app/ui/media_list/media_youtube.dart';

class MediaListDetail extends StatelessWidget {
  final MediaDetail _mediaDetail;
  final List<MediaVideo> _mediaVideo;

  const MediaListDetail(this._mediaDetail, this._mediaVideo);

  @override
  Widget build(BuildContext context) {
    print('${_mediaDetail.video}  ${_mediaDetail.id}');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${_mediaDetail.title.toUpperCase()}',
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageOrVideo(
                mediaDetail: _mediaDetail,
                mediaVideo: _mediaVideo,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Icon(Icons.date_range),
                        ),
                        Text(
                          _mediaDetail.releaseDate,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'SINOPSIS',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      _mediaDetail.overview,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.justify,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ImageOrVideo extends StatelessWidget {
  const ImageOrVideo(
      {Key key,
      @required MediaDetail mediaDetail,
      @required List<MediaVideo> mediaVideo})
      : _mediaDetail = mediaDetail,
        _mediaVideo = mediaVideo,
        super(key: key);

  final MediaDetail _mediaDetail;
  final List<MediaVideo> _mediaVideo;

  @override
  Widget build(BuildContext context) {
    if (_mediaVideo.isEmpty) {
      return Hero(
        tag: '${_mediaDetail.id}',
        child: FadeInImage.assetNetwork(
          placeholder: 'assets/no-image.jpg',
          image: _mediaDetail.getBackdropUrl(),
          fit: BoxFit.cover,
          width: double.infinity,
          height: 200.0,
          fadeInDuration: Duration(milliseconds: 40),
        ),
      );
    }
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _mediaVideo.length,
        itemBuilder: (_, index) {
          var _video = _mediaVideo[index];
          print(_video.key);
          return Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Container(
              width: _mediaVideo.length > 1 ? 390 : null,
              child: MediaYoutube(_video.key),
            ),
          );
        },
      ),
    );
  }
}
