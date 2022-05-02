

import 'package:flutter/material.dart';

import 'api/feedback_api.dart';
import 'models/feedback.dart';

class RegisterEpisode extends StatefulWidget {
  const RegisterEpisode({Key? key}) : super(key: key);

  @override
  _MyHomePage createState() => _MyHomePage();
}



class _MyHomePage extends State<RegisterEpisode> {

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

