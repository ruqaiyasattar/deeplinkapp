
import 'package:deeplinkdemoapp/pages/myhomepage.dart';
import 'package:deeplinkdemoapp/pages/page_one.dart';
import 'package:deeplinkdemoapp/pages/page_two.dart';
import 'package:deeplinkdemoapp/provider/MyData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(
      ChangeNotifierProvider(
          create: (context) => MyData(),
          child: const MyApp(),
      ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Uni Links Sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (_) => const MyHomePage(title: 'Deep Links by Uni Links'),
        '/page-one': (_) => const PageOne(),
        '/page-two': (_) => const PageTwo(),
      },
    );
  }
}
