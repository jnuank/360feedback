import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'api/feedback_api.dart';
import 'models/feedback.dart';

class ViewBehavior extends StatefulWidget {
  const ViewBehavior({Key? key}) : super(key: key);

  @override
  _MyHomePage createState() => _MyHomePage();
}

class _MyHomePage extends State<ViewBehavior> {
  Feedbacks? _result = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        isAlwaysShown: true,
        child: SingleChildScrollView(
          child: Column(
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
                  onSubmitted: (value) async {
                    Feedbacks feedbacks;
                    feedbacks = await fetchFeedback(value);
                    _result = feedbacks;
                    setState(() {
                      _result;
                    });
                  },
                ),
              ),
              _result == null
                  ? Container()
                  : SizedBox(
                      width: double.infinity,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: DataTable(
                            dataRowHeight: 100,
                            sortAscending: true,
                            sortColumnIndex: 0,
                            columns: _createColumns(),
                            rows: _createRows()),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  List<DataColumn> _createColumns() {
    return const [
      DataColumn(
        label: SizedBox(
          width: 100,
          child: Text('日付'),
        ),
      ),
      DataColumn(
        label: SizedBox(
          width: 400,
          child: Text('出来事'),
        ),
      ),
      DataColumn(
        label: SizedBox(
          width: 100,
          child: Text('行動'),
        ),
      ),
    ];
  }

  List<DataRow> _createRows() {
    return _result!.behaviors
        .map((behavior) => DataRow(cells: [
              DataCell(Text(
                behavior.date.toString(),
                softWrap: true,
                textWidthBasis: TextWidthBasis.parent,
              )),
              DataCell(Text(
                behavior.episode,
                softWrap: true,
                textWidthBasis: TextWidthBasis.parent,
              )),
              DataCell(Text(
                behavior.behavior,
                softWrap: true,
                textWidthBasis: TextWidthBasis.parent,
              )),
            ]))
        .toList();
  }
}
