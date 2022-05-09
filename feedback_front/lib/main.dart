import 'package:feedback_front/api/feedback_api.dart';
import 'package:feedback_front/models/feedback.dart';
import 'package:feedback_front/models/notifier/feedback_notifier.dart';
import 'package:feedback_front/register_episode.dart';
import 'package:feedback_front/view_behavior.dart';
import 'package:feedback_front/view_episode.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(
      ChangeNotifierProvider(
        create: (context) => FeedBackNotifier(),
        child: const MyApp(),
      ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Feedback',
      initialRoute: '/',
      routes: {
        '/': (context) => const TopPage(),
        '/viewBehavior': (context) => const ViewBehavior(),
        '/viewEpisode': (context) => const ViewEpisode(),
        '/register': (context) => RegisterEpisode(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TopPage(),
    );
  }
}

class TopPage extends StatelessWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
           child: const Text('episode'),
           onPressed: () => {
             Navigator.pushNamed(context, '/viewEpisode')
           },
          ),
          ElevatedButton(
           child: const Text('behavior'),
           onPressed: () => {
             Navigator.pushNamed(context, '/viewBehavior')
           },
          ),
          ElevatedButton(
              child: const Text('登録'),
              onPressed: () => {
                Navigator.pushNamed(context, '/register')
              },
          ),
        ],
      )
    );
  }
}

