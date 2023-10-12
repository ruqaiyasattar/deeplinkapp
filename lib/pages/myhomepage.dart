import 'package:deeplinkdemoapp/provider/MyData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';


class MyHomePage extends StatefulWidget {

  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>  {

  late StreamSubscription _sub;

  //This function sets up a subscription to a stream of deep links. When a deep link is received, the code inside this function is executed.
  Future<void> initdeeplink() async {

    //we used StreamBuilder here because unilinks subscribe to a stream to detect whether app have started normally or by the links configured.
    _sub = linkStream.listen((url) {
      if (!mounted) return;
      setState(
            () {
          // Here you have the URL data
          Uri uri = Uri.parse(url!);

          _navigateWithDeepLink(uri);

          final myData = Provider.of<MyData>(context, listen: false);

          // Convert the Uri to a string and update myData
          myData.updateDataWithUri(uri.toString());

          if (kDebugMode) {
            print('deeplink uri -> $uri');
          }
        },
      );
    }, onError: (Object err) {
      if (kDebugMode) {
        print("$err");
      }
    });
  }

  //This function takes a Uri object, then examines the path component of the URL and uses Navigator.pushNamed to navigate accordingly.
  void _navigateWithDeepLink(Uri deepLink) {
    final path = deepLink.path.replaceAll('/link', '');
    if (path == '/') {
      Navigator.pushNamed(context, '/');
      return ;
    }
    if (path == '/page-one/page-two') {
      Navigator.pushNamed(context, '/page-one');
      Navigator.pushNamed(context, '/page-two');
      return;
    }
    Navigator.pushNamed(context, path);
    if (kDebugMode) {
      print('path -> $path');
    }
  }

  @override
  void initState() {
    super.initState();
    //it is called to set up the deep link subscription.
    initdeeplink();
  }

  @override
  void dispose() {
    // It cancels the subscription to the deep link stream to prevent memory leaks.
    _sub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final myData = Provider.of<MyData>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(fontSize: 16),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(myData.data),
            Card(
              borderOnForeground: false,
              elevation: 10,
              child: Image.asset(
                'asset/images/dash.jpg',
              ),
            ),
            CupertinoButton(
              child: const Text('Pages 1'),
              onPressed: () {
                launchUrl(Uri.parse('tdz://genius-team.com/page-one'));
              },
            ),
            CupertinoButton(
              child: const Text('Page 2'),
              onPressed: () {
                launchUrl(Uri.parse('tdz://genius-team.com/page-two'));
              },
            ),
          ],
        ),
      ),
    );
  }

}
