import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'model/latest_videos.dart';
import 'routes/home_route.dart';
import 'routes/intro_route.dart';
import './client_provider.dart';
import './routes/video_detail_route.dart';
import './routes/sermon_video_route.dart';
import './routes/offering_route.dart';
import './routes/offering_detail_route.dart';
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

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeRoute(),
    IntroRoute(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "동부 장로 교회",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  color: cPinkA700.withOpacity(0.5),
                  height: 2,
                  width: 200,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  color: cPinkA700,
                  height: 2,
                  width: 150,
                ),
                SizedBox(
                  height: 30,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _selectedIndex = 0;
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 50,
                            height: 50,
                            child: Text(
                              "처음",
                              style: menuTextStyle.copyWith(
                                  color: _selectedIndex == 0
                                      ? cPrimaryColor
                                      : cPrimaryColor.withOpacity(.4)),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _selectedIndex = 1;
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 50,
                            height: 50,
                            child: Text(
                              "소개",
                              style: menuTextStyle.copyWith(
                                  color: _selectedIndex == 1
                                      ? cPrimaryColor
                                      : cPrimaryColor.withOpacity(.4)),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _selectedIndex = 2;
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 50,
                            height: 50,
                            child: Text(
                              "설교",
                              style: menuTextStyle.copyWith(
                                  color: _selectedIndex == 2
                                      ? cPrimaryColor
                                      : cPrimaryColor.withOpacity(.4)),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _selectedIndex = 3;
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 50,
                            height: 50,
                            child: Text(
                              "연보",
                              style: menuTextStyle.copyWith(
                                  color: _selectedIndex == 3
                                      ? cPrimaryColor
                                      : cPrimaryColor.withOpacity(.4)),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _selectedIndex = 4;
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 50,
                            height: 50,
                            child: Text(
                              "소식",
                              style: menuTextStyle.copyWith(
                                  color: _selectedIndex == 4
                                      ? cPrimaryColor
                                      : cPrimaryColor.withOpacity(.4)),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _selectedIndex = 5;
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 70,
                            height: 50,
                            child: Text(
                              "생방송",
                              style: menuTextStyle.copyWith(
                                  color: _selectedIndex == 5
                                      ? cPrimaryColor
                                      : cPrimaryColor.withOpacity(.4)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: _screens[_selectedIndex],
            ),
          ),
        ],
      ),
    );
  }
}
