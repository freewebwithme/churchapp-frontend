import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../widgets/video_list.dart';
import '../model/playlist_info_argument.dart';
import './read_queries.dart';

class PlaylistitemsQuery extends StatefulWidget {
  _PlaylistitemsQueryState createState() => _PlaylistitemsQueryState();
}

class _PlaylistitemsQueryState extends State<PlaylistitemsQuery> {
  String nextPageToken = "";

  Widget build(BuildContext context) {
    final PlaylistInfoArgument args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          args.playlistTitle,
          overflow: TextOverflow.fade,
        ),
      ),
      body: Query(
          options: QueryOptions(
              documentNode: gql(PLAYLISTITEMS),
              fetchPolicy: FetchPolicy.cacheFirst,
              variables: {
                'playlistId': args.playlistId,
                'nextPageToken': nextPageToken,
              }),
          builder: (QueryResult result,
              {VoidCallback refetch, FetchMore fetchMore}) {
            if (result.hasException) {
              return Text(result.exception.toString());
            }
            if (result.loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            List items = result.data['playlistItems']['items'];

            String token = result.data['playlistItems']['nextPageToken'];
            token = token ?? "";

            FetchMoreOptions opts = FetchMoreOptions(
                variables: {'nextPageToken': token},
                updateQuery: (previousResultData, fetchMoreResultData) {
                  final List<dynamic> newItems = [
                    ...previousResultData['playlistItems']['items']
                        as List<dynamic>,
                    ...fetchMoreResultData['playlistItems']['items']
                        as List<dynamic>
                  ];

                  fetchMoreResultData['playlistItems']['items'] = newItems;
                  return fetchMoreResultData;
                });

            if (token == null || token == "") {
              return Stack(
                children: <Widget>[
                  VideoList(itemCount: items.length, items: items),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      child: FloatingActionButton.extended(
                        onPressed: null,
                        label: Text("전체 리스트 입니다"),
                        icon: Icon(Icons.done_all),
                        backgroundColor: Colors.grey,
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Stack(
                children: <Widget>[
                  VideoList(itemCount: items.length, items: items),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      child: FloatingActionButton.extended(
                        onPressed: () {
                          fetchMore(opts);
                        },
                        label: Text("더 불러오기"),
                        icon: Icon(Icons.more),
                      ),
                    ),
                  ),
                ],
              );
            }
          }),
    );
  }
}
