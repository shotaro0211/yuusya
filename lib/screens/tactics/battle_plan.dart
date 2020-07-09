import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yuusya/screens/tactics.dart';


class BattlePlan extends StatelessWidget {
	BattlePlan({Key key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return new Scaffold(
				appBar: AppBar(
					title: Text('戦術選択'),
				),
        body: BattlePlanPage(),
		);
	}
}

class BattlePlanPage extends StatefulWidget {
  BattlePlanPage({Key key}) : super(key: key);

  BattlePlanPageState createState() => new BattlePlanPageState();
}

class BattlePlanPageState extends State<BattlePlanPage> {
	var _plan = [Plan('猛攻型'), Plan('攻型'), Plan('通常型'), Plan('守型'), Plan('鉄壁')];
	bool selected = false;

  @override
  Widget build(BuildContext context) {
		return ListView.builder(
			itemCount: _plan.length,
			itemBuilder: (context, int index) {
				return new Card(
					child: ListTile(
						title: Column(
							mainAxisSize: MainAxisSize.min,
							crossAxisAlignment: CrossAxisAlignment.start,
							children: <Widget>[
								new Text(_plan[index].name, style: TextStyle(fontSize: 15.0,)),
							]
						),
						trailing: Row(
							mainAxisSize: MainAxisSize.min,
							crossAxisAlignment: CrossAxisAlignment.start,
							children: <Widget>[
								Checkbox(
										activeColor: Colors.blue,
										value: _plan[index].selected,
										onChanged: (bool value) {
											setState(() {
												if (selected == _plan[index].selected && selected == false) {
													battle_plan = index + 1;
													battle_plan_text = _plan[index].name;
													selected = true;
												  _plan[index].selected = true;
												} else if (selected == _plan[index].selected && selected == true) {
													selected = false;
													_plan[index].selected = false;
												}
											});
										}
								),
							]
						),
					),
				);
			}
		);
	}

}

class Plan {
  var name = 'foo';
  var selected = false;

  Plan(this.name);
}
