import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yuusya/components/user_info.dart';


class Sale extends StatelessWidget {
	Sale({Key key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return new Scaffold(
				appBar: AppBar(
					title: Text('アイテム屋-売却'),
				),
        body: SalePage(),
		);
	}
}

class SalePage extends StatefulWidget {
  SalePage({Key key}) : super(key: key);

  SalePageState createState() => new SalePageState();
}

class SalePageState extends State<SalePage> {

  @override
  Widget build(BuildContext context) {
		return StreamBuilder<QuerySnapshot>(
			stream: Firestore.instance.collection('users').document(user_info.getString('id')).collection('items').snapshots(),
			builder: (context, snapshot) {
				if (snapshot.hasError)
					return new Text('Error: ${snapshot.error}');
				switch (snapshot.connectionState) {
					case ConnectionState.waiting: return Container(alignment: Alignment.center, child: CircularProgressIndicator());
					default:
						return new ListView(
							children: snapshot.data.documents.map((DocumentSnapshot document) {
								return new Card(
									child: ListTile(
										leading: Icon(FontAwesomeIcons.flask),
										trailing:
										Row(
											mainAxisSize: MainAxisSize.min,
											crossAxisAlignment: CrossAxisAlignment.start,
											children: <Widget>[
												new Text('${(document['money'] * 0.5).round()}G', style: TextStyle(fontSize: 15.0,)),
												//Icon(Icons.info_outline, color: Colors.cyan,),
											]
										),
										title: 
										Column(
											mainAxisSize: MainAxisSize.min,
											crossAxisAlignment: CrossAxisAlignment.start,
											children: <Widget>[
												new Text('${document['name']}', style: TextStyle(fontSize: 15.0,)),
												new Text('${document['describe']}/${document['type']}', style: TextStyle(fontSize: 10.0,)),
											]
										),
										onTap: () {
											showDialog(context: context, builder: (BuildContext context)  =>  
												AlertDialog(
													title: Text("売却しますか"),
													content: Text("${document['name']}を売却しますか"),
													actions: <Widget>[
														// ボタン領域
														FlatButton(
															child: Text("やめる"),
															onPressed: () => Navigator.pop(context),
														),
														FlatButton(
															child: Text("売却する"),
															onPressed: () {
																Navigator.pop(context);
																if (battled == false) {
																	Firestore.instance.collection('users').document(user_info.getString('id')).collection('items').document(document.documentID).delete();
																	user_money = user_money + (document['money'] * 0.5).round();
																	Firestore.instance.collection('users').document(user_info.getString('id')).updateData({"money": user_money});
															  }	else {
																	return showDialog<void>(
																		context: context,
																		//barrierdismissible: false, // user must tap button!
																		builder: (BuildContext context) {
																			return AlertDialog(
																				title: Text('売却失敗'),
																				content: SingleChildScrollView(
																					child: ListBody(
																						children: <Widget>[
																							Text('討伐中は売却できません。'),
																						],
																					),
																				),
																				actions: <Widget>[
																					FlatButton(
																						child: Text('OK'),
																						onPressed: () {
																							Navigator.of(context).pop();
																						},
																					),
																				],
																			);
																		}
																	);
																}
															},
														),
													],
												)
											);
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
