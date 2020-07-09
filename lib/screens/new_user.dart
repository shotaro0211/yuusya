import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yuusya/components/user_info.dart';
import 'package:yuusya/app.dart';
import 'status.dart';


class New_user extends StatelessWidget {
	New_user({Key key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return new Scaffold(
				appBar: AppBar(
					title: Text('新しい勇者'),
				),
        body: New_userPage(),
		);
	}
}

class New_userPage extends StatefulWidget {
  New_userPage({Key key}) : super(key: key);

  New_userPageState createState() => new New_userPageState();
}
var _nameController = TextEditingController();

class New_userPageState extends State<New_userPage> {
  @override
  Widget build(BuildContext context) {

		return Column(
			children: <Widget>[
				Expanded(
					child:  ListView.separated(
						itemCount: listTiles.length,
						separatorBuilder: (BuildContext context, int index) => Divider(color: Colors.black,),
						itemBuilder: (BuildContext context, int index) {
							return listTiles[index];
						},
					),
		    ),
				SizedBox (
					width: MediaQuery.of(context).size.width,
					height: 50,
					child: RaisedButton(
						child: Text("旅に出る"),
						color: Colors.cyan,
						textColor: Colors.black,
						onPressed: () {
							if (_nameController.text != "") {
								String id = '${DateTime.now().millisecondsSinceEpoch}';
								Map<String, dynamic> data = {
									"id": id,
									"name": _nameController.text.toString(),
									"level": 1,
									"exp": 0,
									"distance": 0,
									"money": 0,
									"category": '無職',
									"str": 10,
									"ac": 10,
									"dex": 10,
									"hp": 20,
									"createdAt": DateTime.now(),
									"complete_count": 1,
								};
								Firestore.instance.collection('users').document(id).setData(data);
								user_info.setBool('user_has', true);
								user_info.setString('id', id);
								User_info.getDatabase();
								Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
									builder: (context) => App()),
									(_) => false
								);
							}
						},
					),
				),
			],
		);
	}

  List<Widget> listTiles = <Widget>[
    Container(
      child: ListTile(
        title: Text(
          "勇者",
          style: TextStyle(fontSize:15, fontWeight: FontWeight.bold),
        ),
      ),
    ),
    Container(
      child: ListTile(
        leading: Text('勇者名'),
				title: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                // your TextField's Content
								controller: _nameController,
              ),
            ),
          ],
				),
      )
    ),
  ];
}
