import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../widgets/video_list.dart';
import '../model/playlist_info_argument.dart';
import './read_queries.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/video_card.dart';

class PlaylistitemsQuery extends StatefulWidget {
  _PlaylistitemsQueryState createState() => _PlaylistitemsQueryState();
}

class _PlaylistitemsQueryState extends State<PlaylistitemsQuery> {
  String nextPageToken = "";
  bool isLoading = false;

  ScrollController controller;

  @override
  void initState() {
    super.initState();
    controller = new ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void _scrollListener() {
    if (controller.position.pixels == controller.position.maxScrollExtent) {
      startLoader();
    }
  }

  void startLoader() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  Widget _loader() {
    return isLoading
        ? new Align(
            child: new Container(
              width: 70.0,
              height: 70.0,
              child: new Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: new Center(child: new CircularProgressIndicator())),
            ),
            alignment: FractionalOffset.bottomCenter,
          )
        : new SizedBox(
            width: 0.0,
            height: 0.0,
          );
  }

  Widget _buildRow(var item) {
    return VideoCard(
      title: item['title'],
      description: item['description'],
      date: item['publishedAt'],
      thumbnailUrl: item['thumbnailUrl'],
      videoId: item['videoId'],
      channelTitle: item['channelTitle'],
    );
  }

  Widget build(BuildContext context) {
    final PlaylistInfoArgument args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: CustomAppBar(title: args.playlistTitle),
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
            print("loading is loading");
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
                var prev = previousResultData['playlistItems']['items']
                    as List<dynamic>;
                var newItems = fetchMoreResultData['playlistItems']['items']
                    as List<dynamic>;
                final List<dynamic> newMergedItems = prev + newItems;

                fetchMoreResultData['playlistItems']['items'] = newMergedItems;
                return fetchMoreResultData;
              });

          return Stack(
            children: <Widget>[
              items.length == 0
                  ? Center(
                      child: Text('영상이 없습니다.'),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: items.length,
                      padding: EdgeInsets.all(3.0),
                      controller: controller,
                      itemBuilder: (context, index) {
                        return _buildRow(items[index]);
                      },
                    ),
              _loader(),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  child: FloatingActionButton.extended(
                    onPressed: token == null || token == ""
                        ? null
                        : () {
                            fetchMore(opts);
                          },
                    label: token == null || token == ""
                        ? Text("전체 리스트 입니다")
                        : Text("더 불러오기"),
                    icon: token == null || token == ""
                        ? Icon(Icons.done_all)
                        : Icon(Icons.more),
                    backgroundColor: token == null || token == ""
                        ? Colors.grey
                        : Colors.blue,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
