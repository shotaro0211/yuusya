import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yuusya/components/user_info.dart';
import 'package:yuusya/screens/status/unit_detail.dart';
import 'package:yuusya/screens/tactics.dart';


class UnitsSelect extends StatelessWidget {
	UnitsSelect({Key key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return new Scaffold(
				appBar: AppBar(
					title: Text('装備品選択'),
				),
        body: UnitsSelectPage(),
		);
	}
}

class UnitsSelectPage extends StatefulWidget {
  UnitsSelectPage({Key key}) : super(key: key);

  UnitsSelectPageState createState() => new UnitsSelectPageState();
}

bool all_selected = false;

class UnitsSelectPageState extends State<UnitsSelectPage> {
	@override
	void initState() {
		units_name = List();
		units = List();
		all_selected = false;
	}

  @override
  Widget build(BuildContext context) {
		return StreamBuilder<QuerySnapshot>(
			stream: Firestore.instance.collection('users').document(user_info.getString('id')).collection('units').snapshots(),
			builder: (context, snapshot) {
				if (snapshot.hasError)
					return new Text('Error: ${snapshot.error}');
				switch (snapshot.connectionState) {
					case ConnectionState.waiting: return Container(alignment: Alignment.center, child: CircularProgressIndicator());
					default:
						bool selected = false;
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
												new Text('${document['describe']}/${document['type']}/${document['category']}', style: TextStyle(fontSize: 10.0,)),
											]
										),
										trailing: Row(
											mainAxisSize: MainAxisSize.min,
											crossAxisAlignment: CrossAxisAlignment.start,
											children: <Widget>[
												Check(name: document['name'], document: document.data),
											]
										),
									),
								);
							}).toList(),
						);
				}
			},
		);
	}
}


class Check extends StatefulWidget {
	final String name;
	final Map document;
	Check({this.name, this.document});

  @override
  _CheckState createState() => _CheckState();
}

class _CheckState extends State<Check> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
			value: selected,
			onChanged: (bool val) {
				setState(() {
					if (all_selected == selected) {
						selected = val;
						all_selected = val;
						if (selected == true) {
							units_name.add(widget.name);
							units.add(widget.document);
						} else {
							int num = units_name.indexOf(widget.name);
							if (num != -1) {
								units_name.removeAt(num);
								units.removeAt(num);
							}
						}
					}
				});
			}
		);
  }
}
