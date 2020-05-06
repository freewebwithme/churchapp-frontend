
import 'package:flutter/material.dart';
import '../routes/playlist_info_argument.dart';

class PlaylistCard extends StatelessWidget {
  PlaylistCard(
      {Key key,
      this.playlistTitle,
      this.thumbnailUrl,
      this.description,
      this.playlistId,
      this.index})
      : super(key: key);

  final String playlistTitle;
  final String thumbnailUrl;
  final String description;
  final String playlistId;
  final int index;

  Widget build(BuildContext context) {
    return
      InkWell(
        splashColor: Theme.of(context).primaryColor.withAlpha(30),
        onTap: () {
          Navigator.pushNamed(
            context,
            '/playlist-detail',
            arguments:
                PlaylistInfoArgument(playlistId, playlistTitle, description),
          );
        },
        child: Container(
          height: 180,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFFFFFFFF),
                Color(0xFFE2E2E2),
              ],
            ),
          ),
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
        ),
    );
  }
}
