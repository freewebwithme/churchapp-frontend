import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'routes/home_route.dart';
import 'routes/intro_route.dart';
import './client_provider.dart';
import './routes/video_detail_route.dart';
import './routes/sermon_video_route.dart';
import './queries/playlistitems_query.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import './queries/read_queries.dart' as queries;
import './model/church.dart';
import './model/video.dart';

void main() async {
  await DotEnv().load('.env');
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //systemNavigationBarColor: Colors.green,
    statusBarColor: Colors.green,
  ));
  runApp(ChurchApp());
}

class ChurchApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return ClientProvider(
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.green,
            textTheme:
                GoogleFonts.nanumMyeongjoTextTheme(Theme.of(context).textTheme),
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => MainPage(),
            '/video-detail': (context) => VideoDetailRoute(),
            '/sermons': (context) => SermonVideoRoute(),
            '/playlist-detail': (context) => PlaylistitemsQuery(),
          }),
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

  Future<Church> church;

  void _onTapped(int index) {
    print("Selected $index");
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _screens = [
    HomeRoute(),
    IntroRoute(),
    SermonVideoRoute(),
  ];

  final String churchUUID = DotEnv().env["CHURCH_UUID"];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Church name", style: GoogleFonts.nanumMyeongjo()),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('처음'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.import_contacts),
            title: Text('소개'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions),
            title: Text('설교'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            title: Text('연보'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.live_tv),
            title: Text('생방송'),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onTapped,
        backgroundColor: colorScheme.onPrimary,
        selectedFontSize: textTheme.caption.fontSize,
        unselectedFontSize: textTheme.caption.fontSize,
        unselectedItemColor: Colors.black38.withOpacity(0.38),
        selectedItemColor: colorScheme.primary,
        type: BottomNavigationBarType.fixed,
      ),
      body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
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
          final String churchName = churchResult["name"];
          final String churchIntro = churchResult["intro"];
          final String slideImageOne = churchResult["slideImageOne"];
          final String slideImageTwo = churchResult["slideImageTwo"];
          final String slideImageThree = churchResult["slideImageThree"];
          var church = Church();
          church.setChurch(churchName, churchIntro, slideImageOne,
              slideImageTwo, slideImageThree);

          print(church.churchName);

          return _screens[_selectedIndex];
        },
      )),
    );
  }
}
