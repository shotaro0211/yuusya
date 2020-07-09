import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yuusya/components/user_info.dart';
import 'package:yuusya/data/units.dart';


class Employment extends StatelessWidget {
	Employment({Key key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return new Scaffold(
				appBar: AppBar(
					title: Text('武器屋-購入'),
				),
        body: EmploymentPage(),
		);
	}
}

class EmploymentPage extends StatefulWidget {
  EmploymentPage({Key key}) : super(key: key);

  EmploymentPageState createState() => new EmploymentPageState();
}

class EmploymentPageState extends State<EmploymentPage> {

  @override
  Widget build(BuildContext context) {
		List<Map> documents = Units().getUnits();
		return ListView.builder(
			itemCount: user_complete_count,
			itemBuilder: (BuildContext context, int index) {
				return new Card(
					child: ListTile(
						leading: Image.asset('assets/icons/sword.png'),
						trailing:
						Row(
							mainAxisSize: MainAxisSize.min,
							crossAxisAlignment: CrossAxisAlignment.start,
							children: <Widget>[
								new Text('${documents[index]['money']}G', style: TextStyle(fontSize: 15.0,)),
								//Icon(Icons.info_outline, color: Colors.cyan,),
							]
						),
						title: 
						Column(
							mainAxisSize: MainAxisSize.min,
							crossAxisAlignment: CrossAxisAlignment.start,
							children: <Widget>[
								new Text('${documents[index]['name']}', style: TextStyle(fontSize: 15.0,)),
								new Text('${documents[index]['describe']}/${documents[index]['type']}/${documents[index]['category']}', style: TextStyle(fontSize: 10.0,)),
							]
						),
						onTap: () {
							showDialog(context: context, builder: (BuildContext context)  =>  
								AlertDialog(
									title: Text("購入しますか"),
									content: Text("${documents[index]['name']}を購入しますか"),
									actions: <Widget>[
										// ボタン領域
										FlatButton(
											child: Text("やめる"),
											onPressed: () => Navigator.pop(context),
										),
										FlatButton(
											child: Text("購入する"),
											onPressed: () {
												Navigator.pop(context);
												if (user_money - documents[index]['money'] >= 0 && battled == false) {
													Firestore.instance.collection('users').document(user_info.getString('id')).collection('units').document().setData(documents[index]);
													int money = user_money - documents[index]['money'];
													Firestore.instance.collection('users').document(user_info.getString('id')).updateData({"money": money});
												} else {
													return showDialog<void>(
														context: context,
														barrierDismissible: false, // user must tap button!
														builder: (BuildContext context) {
															return AlertDialog(
																title: Text('購入失敗'),
																content: SingleChildScrollView(
																	child: ListBody(
																		children: <Widget>[
																			Text('討伐中または、所持金が足りません。'),
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
			},
		);
	}

}
