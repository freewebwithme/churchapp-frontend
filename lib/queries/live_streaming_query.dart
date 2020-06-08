import 'package:churchapp/model/church.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import '../widgets/video_list.dart';
import 'read_queries.dart';

class LiveStreamingQuery extends StatelessWidget {
  Widget build(BuildContext context) {
    return Consumer<Church>(
      builder: (context, church, child) {
        return Query(
            options: QueryOptions(
              documentNode: gql(GET_LIVE_STREAMING),
              fetchPolicy: FetchPolicy.cacheFirst,
              variables: {
                "channelId": church.channelId,
              },
            ),
            builder: (QueryResult result,
                {VoidCallback refetch, FetchMore fetchMore}) {
              if (result.hasException) {
                return Center(
                  child: Text("생방송을 불러올 수 없습니다"),
                );
              }
              if (result.loading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              var videos = result.data['getLiveStreaming']['items'];
              print("Printing live streaming videos $videos");
              if (videos == null) {
                return Center(
                  child: Text("현재 생방송이 없습니다"),
                );
              }
              if (videos.length == 0) {
                return Center(
                  child: Text("현재 생방송이 없습니다"),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: VideoList(itemCount: videos.length, items: videos),
                );
              }
            });
      },
    );
  }
}
