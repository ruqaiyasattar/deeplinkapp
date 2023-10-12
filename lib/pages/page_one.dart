import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../provider/MyData.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    final myData = Provider.of<MyData>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Page 1'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(myData.data),
            Card(
              borderOnForeground: false,
              elevation: 10,
              child: Image.asset(
                'asset/images/pg1.jpg',
              ),
            ),
            CupertinoButton(
              child: const Text('Page 2'),
              onPressed: () {
                launchUrl(Uri.parse('tdz://genius-team.com/page-two'));
                //Navigator.of(context).pushNamed('/page-two');
              },
            ),
          ],
        ),
      ),
    );
  }
}
