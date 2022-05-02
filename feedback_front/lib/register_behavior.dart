


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        ],
      ),
    );
  }

}