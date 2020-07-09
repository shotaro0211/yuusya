import 'package:yuusya/data/yuusya.dart';
import 'package:yuusya/data/enemys/catfang.dart';
import 'prototype.dart';

class SecondQuest extends Quest {
	SecondQuest(user_data, quest_name) {
		this.quest_name = quest_name;
		quest_index = 2;
		exp = 100;
		money = 250;
		distance = 500;
	  enemy = CatFang();
		this.user_data = user_data;
	}

}
