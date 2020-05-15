import 'package:flutter/material.dart';
import '../constants.dart';
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
    return ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: Container(
        width: 100,
        height: 75,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 17),
              blurRadius: 23,
              spreadRadius: -13,
              color: shadowColor,
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              print('channel card tapped');
              Navigator.pushNamed(
                context,
                '/playlist-detail',
                arguments: PlaylistInfoArgument(
                    playlistId, playlistTitle, description),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: <Widget>[
                  Container(
                    height: 42,
                    width: 43,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: cPinkA700),
                    ),
                    child: Icon(
                      Icons.play_arrow,
                      color: cPinkA700,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    playlistTitle,
                    maxLines: 2,
                    style: menuTextStyle,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
