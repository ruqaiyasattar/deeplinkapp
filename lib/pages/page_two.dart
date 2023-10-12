import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../provider/MyData.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final myData = Provider.of<MyData>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Page 2'),),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(myData.data),
            Card(
                borderOnForeground: false,
                elevation: 10,
                child: Image.asset(
                  'asset/images/pg2.jpg',
                ),
            ),
            CupertinoButton(
              child: const Text('page 1'),
              onPressed: () {
                launchUrl(Uri.parse('tdz://genius-team.com/page-one'));

              },
            ),
            const Divider(
              color: Colors.black,
            ),
            CupertinoButton(
              child: const Text('Home'),
              onPressed: () {
               launchUrl(Uri.parse('tdz://genius-team.com/'));
              },
            ),
          ],
        ),
      ),
    );
  }
}
