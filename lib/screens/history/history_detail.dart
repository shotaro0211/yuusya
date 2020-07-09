import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:yuusya/components/user_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HistoryDetail extends StatelessWidget {
  final DocumentSnapshot document;
	HistoryDetail({Key key, this.document}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return new Scaffold(
				appBar: AppBar(
					title: Text('クエスト記録-詳細'),
				),
        body: HistoryDetailPage(document: document),
		);
	}
}

class HistoryDetailPage extends StatefulWidget {
  final DocumentSnapshot document;
  HistoryDetailPage({Key key, this.document}) : super(key: key);

  HistoryDetailPageState createState() => new HistoryDetailPageState(document: document);
}

class HistoryDetailPageState extends State<HistoryDetailPage> {
  final DocumentSnapshot document;
	HistoryDetailPageState({this.document});

  @override
  Widget build(BuildContext context) {
	   
		return ListView.builder(
			itemBuilder: (BuildContext context, int index) {
				return Card(
					child: ListTile(
						title: Text(
							'${document['quest_log'][index]}',
							style: TextStyle(fontSize:15, ),
						),
					),
				);
			},
			itemCount: document['quest_log'].length,
		);
	}

}
