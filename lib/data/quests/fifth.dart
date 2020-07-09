import 'package:yuusya/data/yuusya.dart';
import 'package:yuusya/data/enemys/aspidochelon.dart';
import 'prototype.dart';

class FifthQuest extends Quest {
	FifthQuest(user_data, quest_name) {
		this.quest_name = quest_name;
		quest_index = 5;
		exp = 333;
		money = 777;
		distance = 3000;
	  enemy = Aspidochelon();
		this.user_data = user_data;
	}

}
