import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yuusya/components/user_info.dart';
import 'unit_detail.dart';


class Units extends StatelessWidget {
	Units({Key key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return new Scaffold(
				appBar: AppBar(
					title: Text('装備品一覧'),
				),
        body: UnitsPage(),
		);
	}
}

class UnitsPage extends StatefulWidget {
  UnitsPage({Key key}) : super(key: key);

  UnitsPageState createState() => new UnitsPageState();
}

class UnitsPageState extends State<UnitsPage> {

  @override
  Widget build(BuildContext context) {
		return StreamBuilder<QuerySnapshot>(
			stream: user_units_database,
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
										leading: Image.asset('assets/icons/sword.png'),
										title: 
										Column(
											mainAxisSize: MainAxisSize.min,
											crossAxisAlignment: CrossAxisAlignment.start,
											children: <Widget>[
												new Text('${document['name']}', style: TextStyle(fontSize: 15.0,)),
												new Text('${document['type']}', style: TextStyle(fontSize: 10.0,)),
											]
										),
										trailing: Icon(Icons.info_outline, color: Colors.cyan,),
										onTap: () {
											Navigator.push(context, MaterialPageRoute<Null>(
												settings: const RouteSettings(name: "/unit_detail"),
												builder: (BuildContext context) => UnitDetail(document: document)
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
