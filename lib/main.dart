import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/home_screen.dart';
import 'screens/intro_screen.dart';
import './client_provider.dart';

void main() => runApp(ChurchApp());

String get host {
  if (Platform.isAndroid) {
    return '192.168.1.10';
  } else {
    return 'localhost';
  }
}

final String HTTP_ENDPOINT = 'http://$host:4000/api';
final String WS_ENDPOINT = 'ws://$host:4000/socket';

class ChurchApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ClientProvider(
      uri: HTTP_ENDPOINT,
      subscriptionUri: WS_ENDPOINT,
      child: MaterialApp(
        title: '베리트 개혁 장로 교회',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
          textTheme:
              GoogleFonts.nanumMyeongjoTextTheme(Theme.of(context).textTheme),
        ),
        home: MainPage(title: '베리트 개혁 장로 교회'),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  void _onTapped(int index) {
    print("Selected $index");
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _screens = [
    HomeScreen(),
    IntroScreen()
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title, style: GoogleFonts.nanumMyeongjo()),
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
        backgroundColor: colorScheme.primary,
        selectedFontSize: textTheme.caption.fontSize,
        unselectedFontSize: textTheme.caption.fontSize,
        unselectedItemColor: colorScheme.onPrimary.withOpacity(0.38),
        selectedItemColor: colorScheme.onPrimary,
        type: BottomNavigationBarType.fixed,
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: _screens[_selectedIndex],
      ),
    );
  }
}
