import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'model/latest_videos.dart';
import './client_provider.dart';
import './routes/video_detail_route.dart';
import './routes/sermon_video_route.dart';
import './routes/offering_route.dart';
import './routes/offering_detail_route.dart';
import './routes/main_page.dart';
import './routes/card_detail.dart';
import './queries/playlistitems_query.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import './queries/read_queries.dart' as queries;
import './model/church.dart';
import './constants.dart';

void main() async {
  await DotEnv().load('.env');
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //systemNavigationBarColor: Colors.green,
    statusBarColor: cPrimaryColor,
  ));
  runApp(ChurchApp());
}

class ChurchApp extends StatelessWidget {
  // This widget is the root of your application.
  final String churchUUID = DotEnv().env["CHURCH_UUID"];

  @override
  Widget build(BuildContext context) {
    return ClientProvider(
      child: Query(
        options: QueryOptions(
            documentNode: gql(queries.getChurch),
            fetchPolicy: FetchPolicy.cacheFirst,
            variables: {
              'uuid': churchUUID,
            }),
        builder: (QueryResult result,
            {VoidCallback refetch, FetchMore fetchMore}) {
          if (result.hasException) {
            return Text("데이터를 불러오는데 실패했습니다. 다시 시도하세요");
          }
          if (result.loading) {
            return CircularProgressIndicator(
              semanticsLabel: "불러오는 중....",
            );
          }

          var churchResult = result.data["getChurch"];
          List latestVideos = result.data["getChurch"]["latestVideos"];
          final String churchId = churchResult["id"];
          final String churchName = churchResult["name"];
          final String churchIntro = churchResult["intro"];
          final String churchChannelId = churchResult["channelId"];
          final String slideImageOne = churchResult["slideImageOne"];
          final String slideImageTwo = churchResult["slideImageTwo"];
          final String slideImageThree = churchResult["slideImageThree"];

          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (context) => Church(
                    id: churchId,
                    name: churchName,
                    intro: churchIntro,
                    channelId: churchChannelId,
                    slideImageOne: slideImageOne,
                    slideImageTwo: slideImageTwo,
                    slideImageThree: slideImageThree),
              ),
              ChangeNotifierProvider(
                create: (context) => LatestVideos(latestVideos: latestVideos),
              ),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                scaffoldBackgroundColor: cWhiteColor,
                primaryColor: cWhiteColor,
                textTheme: GoogleFonts.nanumMyeongjoTextTheme(
                    Theme.of(context).textTheme),
              ),
              initialRoute: '/',
              routes: {
                '/': (context) => MainPage(),
                '/video-detail': (context) => VideoDetailRoute(),
                '/sermons': (context) => SermonVideoRoute(),
                '/playlist-detail': (context) => PlaylistitemsQuery(),
                '/offering': (context) => OfferingRoute(),
                '/card-detail': (context) => CardDetailRoute(),
                '/offering-detail': (context) => OfferingDetailRoute(),
              },
            ),
          );
        },
      ),
    );
  }
}
