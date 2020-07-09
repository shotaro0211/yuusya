import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yuusya/components/user_info.dart';
import 'package:yuusya/screens/status/item_detail.dart';
import 'package:yuusya/screens/tactics.dart';


class ItemsSelect extends StatelessWidget {
	ItemsSelect({Key key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return new Scaffold(
				appBar: AppBar(
					title: Text('アイテム選択'),
				),
        body: ItemsSelectPage(),
		);
	}
}

class ItemsSelectPage extends StatefulWidget {
  ItemsSelectPage({Key key}) : super(key: key);

  ItemsSelectPageState createState() => new ItemsSelectPageState();
}

class ItemsSelectPageState extends State<ItemsSelectPage> {
	@override
	void initState() {
		items_name = List();
		items = List();
	}

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
										title: 
										Column(
											mainAxisSize: MainAxisSize.min,
											crossAxisAlignment: CrossAxisAlignment.start,
											children: <Widget>[
												new Text('${document['name']}', style: TextStyle(fontSize: 15.0,)),
												new Text('${document['describe']}/${document['type']}', style: TextStyle(fontSize: 10.0,)),
											]
										),
										trailing: Row(
											mainAxisSize: MainAxisSize.min,
											crossAxisAlignment: CrossAxisAlignment.start,
											children: <Widget>[
												Check(name: document['name'], document: document.data, document_id: document.documentID),
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
	final String document_id;
	Check({this.name, this.document, this.document_id});

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
					selected = val;
					if (selected == true) {
						items_name.add(widget.name);
						items.add(widget.document);
						items_id.add(widget.document_id);
					} else {
            int num = items_name.indexOf(widget.name);
						if (num != -1) {
							items_name.removeAt(num);
							items.removeAt(num);
						  items_id.removeAt(num);
						}
					}
				});
			}
		);
  }
}
