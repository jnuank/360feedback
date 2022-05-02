

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterEpisode extends StatelessWidget {
  RegisterEpisode({Key? key}) : super(key: key);

  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _episodeController = TextEditingController();
  final TextEditingController _behaviorController = TextEditingController();
  final TextEditingController _memberController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:
        Column(
          children:  [
            Text('日付'),
            TextField(controller: _dateController,),
            Text('エピソード'),
            TextField(controller: _episodeController,),
            Text('行動'),
            TextField(controller: _behaviorController,),
            Text('メンバー名'),
            TextField(controller: _memberController,),
            ElevatedButton(
                child: Text('登録'),
                onPressed: () => {
                  print(_dateController.text),
                  print(_behaviorController.text),
                  print(_episodeController.text),
                  print(_memberController.text),
            }),
          ],
        ),
    );
  }
}