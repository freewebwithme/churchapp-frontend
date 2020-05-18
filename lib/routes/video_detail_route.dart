import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../model/video.dart';
import '../widgets/custom_appbar.dart';

class VideoDetailRoute extends StatefulWidget {
  @override
  _VideoDetailRouteState createState() => _VideoDetailRouteState();
}

class _VideoDetailRouteState extends State<VideoDetailRoute> {
  YoutubePlayerController _controller;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;

  @override
  void initState() {
    super.initState();
    print('video detail initState called');
  }

  @override
  void dispose() {
    _controller.dispose();
    print('_controller disposed? $_controller');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Video args = ModalRoute.of(context).settings.arguments;

    _controller = YoutubePlayerController(
      initialVideoId: args.videoId,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: _muted,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHideAnnotation: false,
        forceHD: false,
        enableCaption: true,
      ),
    );
    return Scaffold(
      appBar: CustomAppBar(title: "설교 영상"),
      body: Column(children: <Widget>[
        YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.amber,
          progressColors: ProgressBarColors(
            playedColor: Colors.amber,
            handleColor: Colors.amberAccent,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                args.title,
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 18, height: 1.5),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),
              ),
              Text(
                args.channelTitle,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),
              ),
              Text(args.date),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),
              ),
              Text(
                args.description,
                overflow: TextOverflow.visible,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
