import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../widgets/video_list.dart';

class HomeQuery extends StatelessWidget {
  String searchVideos = """
  query(
    \$order: String!
    \$query: String!
    \$maxResults: Int!
    \$nextPageToken: String
  ) {
    searchVideos(
      order: \$order
      query: \$query
      maxResults: \$maxResults
      nextPageToken: \$nextPageToken
    ) {
      id
      etag
      nextPageToken
      prevPageToken
      resultsPerPage
      totalResults
      items {
        id
        videoId
        channelId
        channelTitle
        description
        etag
        liveBroadcastContent
        publishedAt
        thumbnailUrl
        title
      }
    }
  }
""";

  Widget build(BuildContext context) {
    return Query(
        options: QueryOptions(documentNode: gql(searchVideos), fetchPolicy: FetchPolicy.networkOnly, variables: {
          'order': 'date',
          'query': '',
          'maxResults': 2,
          'nextPageToken': '',
        }),
        builder: (QueryResult result,
            {VoidCallback refetch, FetchMore fetchMore}) {
          if (result.hasException) {
            return Text(result.exception.toString());
          }
          if (result.loading) {
            return Text('Loading');
          }

          List items = result.data['searchVideos']['items'];

          return VideoList(itemCount: items.length, items: items);
        });
  }
}
