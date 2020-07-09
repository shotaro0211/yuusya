import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:yuusya/components/user_info.dart';
import 'package:yuusya/screens/tactics.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Result extends StatelessWidget {
	Result({Key key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return new Scaffold(
				appBar: AppBar(
					title: Text('クエスト結果'),
				),
        body: ResultPage(),
		);
	}
}

class ResultPage extends StatefulWidget {
  ResultPage({Key key}) : super(key: key);

  ResultPageState createState() => new ResultPageState();
}

class ResultPageState extends State<ResultPage> {

  @override
  Widget build(BuildContext context) {
		return Column(
			children: <Widget>[
				Expanded(
					child: StreamBuilder<QuerySnapshot>(
						stream: Firestore.instance.collection('users').document(user_info.getString('id')).collection('quest_logs').orderBy('createdAt', descending: true).snapshots(),
						builder: (context, snapshot) {
							if (snapshot.hasError)
								return new Text('Error: ${snapshot.error}');
							switch (snapshot.connectionState) {
								case ConnectionState.waiting: return Container(alignment: Alignment.center, child: CircularProgressIndicator());
								default:
									var document = snapshot.data.documents[0];
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
						},
					),
				),
				SizedBox (
					width: MediaQuery.of(context).size.width,
					height: 50,
					child: RaisedButton(
						child: Text("OK"),
						color: Colors.cyan,
						textColor: Colors.black,
						onPressed: () {
							Navigator.pushReplacement(context, MaterialPageRoute(
								builder: (context) => Tactics()
							));
						},
					),
				),
			],
		);
	}

}
