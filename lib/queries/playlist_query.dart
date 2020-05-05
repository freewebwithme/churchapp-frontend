import 'package:churchapp/model/church.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import '../widgets/playlist_card.dart';

class PlaylistQuery extends StatelessWidget {
  final String ALL_PLAYLISTS = """
  query(\$channelId: String) {
    playlists(channelId: \$channelId) {
      id
      playlistId
      playlistTitle
      description
      thumbnailUrl
    }
  }
  """;
  Widget build(BuildContext context) {
    return Consumer<Church>(builder: (context, church, child) {
      return Query(
        options: QueryOptions(
          documentNode: gql(ALL_PLAYLISTS),
          fetchPolicy: FetchPolicy.cacheFirst,
          variables: {
            "channelId": church.channelId,
          },
        ),
        builder: (QueryResult result,
            {VoidCallback refetch, FetchMore fetchMore}) {
          if (result.hasException) {
            return Text(result.exception.toString());
          }
          if (result.loading) {
            return Text('Loading');
          }

          var playlists = result.data['playlists'];
          print("printing playlists $playlists");
          if (playlists.length == 0) {
            return Center(
              child: Text("유투브에 등록된 채널이 없습니다"),
            );
          } else {
            return GridView.builder(
              itemCount: playlists.length,
              padding: const EdgeInsets.all(8),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 20.0,
              ),
              itemBuilder: (context, index) {
                final playlist = playlists[index];
                return PlaylistCard(
                  playlistId: playlist['playlistId'],
                  playlistTitle: playlist['playlistTitle'],
                  thumbnailUrl: playlist['thumbnailUrl'],
                  description: playlist['description'],
                );
              },
            );
          }
        },
      );
    });
  }
}
