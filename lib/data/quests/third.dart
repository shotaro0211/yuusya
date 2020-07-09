import 'package:yuusya/data/yuusya.dart';
import 'package:yuusya/data/enemys/dorakyura.dart';
import 'prototype.dart';

class ThirdQuest extends Quest {
	ThirdQuest(user_data, quest_name) {
		this.quest_name = quest_name;
		quest_index = 3;
		exp = 130;
		money = 500;
		distance = 750;
	  enemy = Dorakyura();
		this.user_data = user_data;
	}

}
