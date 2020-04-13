import 'dart:convert' show json;

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import "package:http/http.dart" as http;

GoogleSignIn _googleSignIn = GoogleSignIn(
  clientId: "539886789822-113uvdmpru35033vn9vq059vbcs08u5p.apps.googleusercontent.com",
  scopes: [
    'https://www.googleapis.com/auth/youtube.readonly',
    'profile',
  ],
);

class IntroRoute extends StatefulWidget {
  @override
  IntroRouteState createState() => IntroRouteState();
}

class IntroRouteState extends State<IntroRoute> {
  GoogleSignInAccount _currentUser;
  GoogleSignInAuthentication _currentUserAuth;
  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      setState(() {
        _currentUser = account;
      });
    });
    _googleSignIn.signInSilently();
  }

  Future<void> _handleSignIn() async {
    try {
      _currentUser = await _googleSignIn.signIn();
      GoogleSignInAuthentication _currentUserAuth =
          await _currentUser.authentication;
      print("user logged in: ${_currentUserAuth.accessToken}");
    } catch (error) {
      print(error);
    }
  }

  Future<void> _getVideos() async {
    final http.Response response = await http.get(
        'https://www.googleapis.com/youtube/v3/search?part=snippet&channelId=UC9gLvizz4807DyTyA3o9eaw',
        headers: await _currentUser.authHeaders);
    if (response.statusCode != 200) {
      print(
          'YouTube Data API ${response.statusCode} response: ${response.body}');
      return;
    }
    final Map<String, dynamic> data = json.decode(response.body);
    print("Printing success: ${data}");
  }

  Future<void> _handleSignOut() => _googleSignIn.disconnect();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Google Sign In'),
          RaisedButton(
            child: Text('Sign In'),
            onPressed: () {
              print('button clicked');
              _handleSignIn();
            },
          ),
          RaisedButton(
            child: Text('show info'),
            onPressed: () {
              _currentUser.authentication.then((value) =>
                  print('printing authentication value: ${value.accessToken}'));
            },
          ),
          RaisedButton(
            child: Text('Sign out'),
            onPressed: () {
              print('button clicked');
              _handleSignOut();
            },
          ),
          RaisedButton(
            child: Text('Show'),
            onPressed: () {
              print('fetching videos...');
              _getVideos();
            },
          ),
        ],
      ),
    );
  }
}
