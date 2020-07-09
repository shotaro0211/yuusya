import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yuusya/components/user_info.dart';
import 'package:yuusya/components/time_japan.dart';
import 'history/history_detail.dart';


class History extends StatelessWidget {
	History({Key key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return new Scaffold(
				appBar: AppBar(
					title: Text('クエスト記録'),
				),
        body: HistoryPage(),
		);
	}
}

class HistoryPage extends StatefulWidget {
  HistoryPage({Key key}) : super(key: key);

  HistoryPageState createState() => new HistoryPageState();
}

class HistoryPageState extends State<HistoryPage> {

  @override
  Widget build(BuildContext context) {
		return StreamBuilder<QuerySnapshot>(
			stream: Firestore.instance.collection('users').document(user_info.getString('id')).collection('quest_logs').orderBy("createdAt", descending: true).snapshots(),
			builder: (context, snapshot) {
				if (snapshot.hasError)
					return new Text('Error: ${snapshot.error}');
				switch (snapshot.connectionState) {
					case ConnectionState.waiting: return Container(alignment: Alignment.center, child: CircularProgressIndicator());
					default:
						return new ListView(
							children: snapshot.data.documents.map((DocumentSnapshot document) {
								String time_japan = TimeJapan().sentDateFormatted(document['createdAt'].toDate().toString());
								return new Card(
									child: ListTile(
										leading: Icon(Icons.content_paste),
										title: 
										Column(
											mainAxisSize: MainAxisSize.min,
											crossAxisAlignment: CrossAxisAlignment.start,
											children: <Widget>[
												new Text('${document['quest_name']}', style: TextStyle(fontSize: 15.0,)),
												new Text('${time_japan}', style: TextStyle(fontSize: 10.0,)),
											]
										),
										trailing: Icon(Icons.info_outline, color: Colors.cyan,),
										onTap: () {
											Navigator.push(context, MaterialPageRoute<Null>(
												settings: const RouteSettings(name: "/history_detail"),
												builder: (BuildContext context) => HistoryDetail(document: document)
											));
										},
									),
								);
							}).toList(),
						);
				}
			},
		);
	}

}
