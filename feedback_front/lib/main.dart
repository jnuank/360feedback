import 'package:feedback_front/api/feedback_api.dart';
import 'package:feedback_front/models/feedback.dart';
import 'package:feedback_front/models/notifier/feedback_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page  aaaaa  bbbb aaaaa'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;
  @override
  _MyHomePage createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {

  Feedbacks? _result = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             Container(
               padding: const EdgeInsets.all(8),
               child: const Text(
                 'メンバー名',
                 style: TextStyle(
                   fontSize: 16,
                   fontWeight: FontWeight.bold,
                 ),
               ),
             ),
           Container(
             width: 200,
             child: TextField(
               onSubmitted: (value) async{
                 Feedbacks feedbacks;
                 feedbacks = await fetchFeedback(value);
                 _result = feedbacks;
                 setState(() {
                   _result;
                 });
               },
             ),
           ),
             _result == null ? Container() : Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: _result!.behaviors.map((behavior) {
                 return Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   Text(
                     'エピソード： ${behavior.episode}'
                    ),
                    Text(
                      '行動： ${behavior.behavior}'
                    ),
                    const Padding(padding: EdgeInsets.all(8)),
                  ],
                 );
               }).toList(),
             ),
         ],
        ),
      ),
      ),
    );
  }
}

