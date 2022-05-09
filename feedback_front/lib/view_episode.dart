import 'package:feedback_front/api/feedback_api.dart';
import 'package:feedback_front/register_behavior.dart';
import 'package:flutter/material.dart';

import 'models/episode.dart';

class ViewEpisode extends StatefulWidget {
  const ViewEpisode({Key? key}) : super(key: key);

  @override
  _EpisodePage createState() => _EpisodePage();
}

class _EpisodePage extends State<ViewEpisode> {
  Episodes? _result = null;

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
                width: 200,
                child: TextField(
                  onSubmitted: (value) async {
                    _result = await fetchEpisodes();
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
                    rows: _createRows(),
                  ),
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
          child: Text('Id'),
        ),
      ),
      DataColumn(
        label: SizedBox(
          width: 100,
          child: Text('日付'),
        ),
      ),
      DataColumn(
        label: SizedBox(
          width: 100,
          child: Text('出来事'),
        ),
      ),
      DataColumn(
        label: SizedBox(
          width: 100,
          child: Text('Button'),
        ),
      ),
    ];
  }

  List<DataRow> _createRows() {
    return _result!.values
    .map((v) => DataRow(cells: [
      DataCell(Text(
        v.id!,
        softWrap: true,
        textWidthBasis: TextWidthBasis.parent,
      )),
      DataCell(Text(
        v.date.toString(),
        softWrap: true,
        textWidthBasis: TextWidthBasis.parent,
      )),
      DataCell(Text(
        v.contents,
        softWrap: true,
        textWidthBasis: TextWidthBasis.parent,
      )),
      DataCell(ElevatedButton(
        onPressed: () => {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) =>
                RegisterBehavior(episodeId: v.id!)))
        },
        child: const Text('行動登録'),
      )),
    ]))
    .toList();
  }
}