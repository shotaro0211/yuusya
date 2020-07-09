import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:yuusya/data/units.dart';
import 'unit_dictionary_detail.dart';


class UnitDictionary extends StatelessWidget {
	UnitDictionary({Key key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return new Scaffold(
				appBar: AppBar(
					title: Text('装備品辞典'),
				),
        body: UnitDictionaryPage(),
		);
	}
}

class UnitDictionaryPage extends StatefulWidget {
  UnitDictionaryPage({Key key}) : super(key: key);

  UnitDictionaryPageState createState() => new UnitDictionaryPageState();
}

class UnitDictionaryPageState extends State<UnitDictionaryPage> {

  @override
  Widget build(BuildContext context) {
		List<Map> documents = Units().getUnits();
		return new ListView(
			children: documents.map((Map document) {
				return new Card(
					child: ListTile(
						leading: Icon(Icons.android),
						title: 
						Column(
							mainAxisSize: MainAxisSize.min,
							crossAxisAlignment: CrossAxisAlignment.start,
							children: <Widget>[
								new Text('${document['tribe_name']}', style: TextStyle(fontSize: 15.0,)),
								new Text('${document['type']}/${document['rank']}', style: TextStyle(fontSize: 10.0,)),
							]
						),
						trailing: Icon(Icons.info_outline, color: Colors.cyan,),
						onTap: () {
							Navigator.push(context, MaterialPageRoute<Null>(
								settings: const RouteSettings(name: "/unit_dictionary_detail"),
								builder: (BuildContext context) => UnitDictionaryDetail(document: document)
							));
						},
					),
				);
			}).toList(),
		);
	}


}
