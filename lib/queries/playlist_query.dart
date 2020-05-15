import 'package:churchapp/model/church.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../widgets/playlist_card.dart';
import './read_queries.dart';

class PlaylistQuery extends StatelessWidget {
  Widget build(BuildContext context) {
    return Consumer<Church>(
      builder: (context, church, child) {
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
              return Center(child: CircularProgressIndicator());
            }

            var playlists = result.data['playlists'];
            print("printing playlists $playlists");
            if (playlists.length == 0) {
              return Center(
                child: Text("유투브에 등록된 채널이 없습니다"),
              );
            } else {
              return Column(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: StaggeredGridView.countBuilder(
                        staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                        padding: EdgeInsets.all(10),
                        crossAxisCount: 1,
                        itemCount: playlists.length,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        itemBuilder: (context, index) {
                          final playlist = playlists[index];
                          return PlaylistCard(
                            playlistId: playlist['playlistId'],
                            playlistTitle: playlist['playlistTitle'],
                            thumbnailUrl: playlist['thumbnailUrl'],
                            description: playlist['description'],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        );
      },
    );
  }
}
