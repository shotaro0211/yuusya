import 'package:yuusya/data/yuusya.dart';
import 'package:yuusya/data/enemys/slime.dart';
import 'prototype.dart';

class FirstQuest extends Quest {
	FirstQuest(user_data, quest_name) {
		this.quest_name = quest_name;
		quest_index = 1;
		exp = 50;
		money = 100;
		distance = 100;
	  enemy = Slime();
		this.user_data = user_data;
	}

}
