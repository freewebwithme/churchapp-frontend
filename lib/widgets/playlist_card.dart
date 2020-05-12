import 'package:flutter/material.dart';
import '../model/playlist_info_argument.dart';

class PlaylistCard extends StatelessWidget {
  PlaylistCard(
      {Key key,
      this.playlistTitle,
      this.thumbnailUrl,
      this.description,
      this.playlistId})
      : super(key: key);

  final String playlistTitle;
  final String thumbnailUrl;
  final String description;
  final String playlistId;

  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        splashColor: Theme.of(context).primaryColor.withAlpha(30),
        onTap: () {
          print('channel card tapped');
          Navigator.pushNamed(
            context,
            '/playlist-detail',
            arguments:
                PlaylistInfoArgument(playlistId, playlistTitle, description),
          );
        },
        child: Container(
          width: 100,
          height: 50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(playlistTitle,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                    )),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).cardTheme.color,
            shape: BoxShape.rectangle,
          ),
        ),
      ),
    );
  }
}
