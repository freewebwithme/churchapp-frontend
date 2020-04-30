import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../widgets/video_list.dart';

class VideoQuery extends StatelessWidget {
  VideoQuery({
    Key key,
    this.count,
  }) : super(key: key);
  final int count;

  final String mostRecent = """
  query(\$count: Int!) {
    mostRecent(count: \$count) {
      id
      title
      description
      videoId
      thumbnailUrl
      publishedAt
      channelTitle
    }
  }
""";

  Widget build(BuildContext context) {
    return Query(
        options: QueryOptions(
            documentNode: gql(mostRecent),
            fetchPolicy: FetchPolicy.cacheFirst,
            variables: {
              'count': count,
            }),
        builder: (QueryResult result,
            {VoidCallback refetch, FetchMore fetchMore}) {
          if (result.hasException) {
            return Text(result.exception.toString());
          }
          if (result.loading) {
            return Text('Loading');
          }

          List items = result.data['mostRecent'];

          return VideoList(itemCount: items.length, items: items);
        });
  }
}
