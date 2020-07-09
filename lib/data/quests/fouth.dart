import 'package:yuusya/data/yuusya.dart';
import 'package:yuusya/data/enemys/owlbear.dart';
import 'prototype.dart';

class FouthQuest extends Quest {
	FouthQuest(user_data, quest_name) {
		this.quest_name = quest_name;
		quest_index = 4;
		exp = 200;
		money = 650;
		distance = 2000;
	  enemy = OwlBear();
		this.user_data = user_data;
	}

}
