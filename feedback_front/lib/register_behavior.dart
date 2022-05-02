import 'package:feedback_front/main.dart';
import 'package:flutter/material.dart';
import 'api/feedback_api.dart';
import 'models/behavior.dart';

class RegisterBehavior extends StatelessWidget {
  RegisterBehavior({Key? key, required this.episodeId}) : super(key: key);

  final String episodeId;

  final TextEditingController _memberController = TextEditingController();
  final TextEditingController _behaviorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(episodeId),
          const Text('メンバー'),
          TextField(controller: _memberController,),
          const Text('行動'),
          TextField(controller: _behaviorController,),
          ElevatedButton(
            child: const Text('登録'),
            onPressed: () async {
              addBehavior();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => const TopPage())
                );
            },
          )
        ],
      ),
    );
  }

  Future<bool> addBehavior() async {
    final behavior = Behavior(_memberController.text, _behaviorController.text);
    int res = 0;
    try {
      res = await registerBehavior(behavior, episodeId.replaceAll('"', ''));
    } on Exception catch(e) {
      print(e);
      return false;
    }
    return res == 200;
  }
}