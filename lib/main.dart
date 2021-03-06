import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'model/latest_videos.dart';
import 'model/church.dart';
import 'model/news.dart';
import 'model/employee.dart';
import './client_provider.dart';
import './routes/video_detail_route.dart';
import './routes/sermon_video_route.dart';
import './routes/offering_route.dart';
import './routes/main_page.dart';
import './routes/card_detail.dart';
import './routes/news_detail.dart';
import './routes/error_page.dart';
import './routes/app_not_active_page.dart';
import './routes/loading_page.dart';
import './queries/playlistitems_query.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import './queries/read_queries.dart' as queries;
import './constants.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() async {
  await DotEnv().load('.env');
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      //systemNavigationBarColor: Colors.green,
      //statusBarColor: cPrimaryColor,
      ));
  //Remove this method to stop OneSignal Debugging
  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
  //var status = OneSignal.shared.getPermissionSubscriptionState();
  //print("Printing OneSignal: $status");
  OneSignal.shared.init(DotEnv().env["ONESIGNAL_APP_ID"], iOSSettings: {
    OSiOSSettings.autoPrompt: false,
    OSiOSSettings.inAppLaunchUrl: false
  });
  OneSignal.shared
      .setInFocusDisplayType(OSNotificationDisplayType.notification);

  // The promptForPushNotificationsWithUserResponse function will show the iOS push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
  await OneSignal.shared
      .promptUserForPushNotificationPermission(fallbackToSettings: true);
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
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                scaffoldBackgroundColor: defaultBgColor,
                primaryColor: cPrimaryAccentColor,
                textTheme: GoogleFonts.nanumMyeongjoTextTheme(
                    Theme.of(context).textTheme),
              ),
              initialRoute: '/',
              routes: {
                '/': (context) => ErrorPage(),
              },
            );
          }

          if (result.loading) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                scaffoldBackgroundColor: defaultBgColor,
                primaryColor: cPrimaryAccentColor,
                textTheme: GoogleFonts.nanumMyeongjoTextTheme(
                    Theme.of(context).textTheme),
              ),
              initialRoute: '/',
              routes: {
                '/': (context) => LoadingPage(),
              },
            );
          }

          var churchResult = result.data["getChurch"];
          var active = churchResult["active"];

          if (active) {
            var churchSchedules = churchResult["schedules"];
            List churchEmployees = churchResult["employees"];
            List churchNews = churchResult["news"];
            List latestVideos = churchResult["latestVideos"];
            final String churchId = churchResult["id"];
            final String churchName = churchResult["name"];
            final String churchIntro = churchResult["intro"];
            final String churchChannelId = churchResult["channelId"];
            final String churchAddressLineOne = churchResult["addressLineOne"];
            final String churchAddressLineTwo = churchResult["addressLineTwo"];
            final String churchEmail = churchResult["email"];
            final String churchPhoneNumber = churchResult["phoneNumber"];

            return MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (context) => Church(
                    id: churchId,
                    name: churchName,
                    intro: churchIntro,
                    channelId: churchChannelId,
                    addressLineOne: churchAddressLineOne,
                    addressLineTwo: churchAddressLineTwo,
                    email: churchEmail,
                    phoneNumber: churchPhoneNumber,
                    schedules: churchSchedules,
                  ),
                ),
                ChangeNotifierProvider(
                  create: (context) =>
                      Employee(churchEmployees: churchEmployees),
                ),
                ChangeNotifierProvider(
                  create: (context) => News(churchNews: churchNews),
                ),
                ChangeNotifierProvider(
                  create: (context) => LatestVideos(latestVideos: latestVideos),
                ),
              ],
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  scaffoldBackgroundColor: defaultBgColor,
                  primaryColor: cPrimaryAccentColor,
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
                  '/news-detail': (context) => NewsDetailRoute(),
                },
              ),
            );
          } else {
            print("calling app not active");
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              routes: <String, WidgetBuilder>{
                '/': (BuildContext context) {
                  return Scaffold(
                    body: Center(
                      child: Text(
                        "앱이 활성화 되어 있지 않습니다.",
                      ),
                    ),
                  );
                }
              },
            );
          }
        },
      ),
    );
  }
}
