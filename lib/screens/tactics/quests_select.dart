import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yuusya/components/user_info.dart';
import 'package:yuusya/screens/tactics.dart';


class BattleField extends StatelessWidget {
	BattleField({Key key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return new Scaffold(
				appBar: AppBar(
					title: Text('奪還地域選択'),
				),
        body: BattleFieldPage(),
		);
	}
}

class BattleFieldPage extends StatefulWidget {
  BattleFieldPage({Key key}) : super(key: key);

  BattleFieldPageState createState() => new BattleFieldPageState();
}

class BattleFieldPageState extends State<BattleFieldPage> {
	var _plan = [Plan('現れた！ついに！　魔物が・・'), Plan('次なる敵は大いなる・・'), Plan('夜の魔王が降臨した・・'), Plan('天井天下唯我独尊！！！'), Plan('古代兵器爆誕生！！！！'), Plan('覇王アレクネ')];
	bool selected = false;

  @override
  Widget build(BuildContext context) {
		return ListView.builder(
			itemCount: complete_count,
			itemBuilder: (context, int index) {
				return new Card(
					child: ListTile(
						leading: Icon(FontAwesomeIcons.skullCrossbones),
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
													quests_select = index + 1;
													quests_select_text = _plan[index].name;
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
  var name = '';
  var selected = false;

  Plan(this.name);
}
