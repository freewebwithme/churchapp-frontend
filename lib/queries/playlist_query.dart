import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../widgets/playlist_card.dart';

class PlaylistQuery extends StatelessWidget {
  final String ALL_PLAYLISTS = """
  query {
    playlists {
      id
      playlistId
      playlistTitle
      description
      thumbnailUrl
    }
  }
  """;
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        documentNode: gql(ALL_PLAYLISTS),
        fetchPolicy: FetchPolicy.cacheFirst,
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
      },
    );
  }
}
