import 'package:feedback_front/api/feedback_api.dart';
import 'package:feedback_front/register_behavior.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models/episode.dart';

class RegisterEpisode extends StatelessWidget {
  RegisterEpisode({Key? key}) : super(key: key);

  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _episodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('日付'),
          TextField(
            controller: _dateController,
          ),
          const Text('エピソード'),
          TextField(
            controller: _episodeController,
          ),
          ElevatedButton(
              child: const Text('登録'),
              onPressed: () async {
                String result = await addEpisode();
                if (result != 'not responded') {
                  print('ok');
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>
                          RegisterBehavior(episodeId: result)));
                }
              }),
        ],
      ),
    );
  }

  Future<String> addEpisode() {
    final episode =
        Episode.of(_episodeController.text,DateTime.parse(_dateController.text));
    Future<String> res = Future.value('null');
    try {
      res = registerEpisode(episode);
    } on Exception catch (e) {
      print(e);
      return Future.value('not responded');
    }
    return res;
  }
}
