import 'package:yuusya/data/yuusya.dart';
import 'package:yuusya/data/enemys/arachne.dart';
import 'prototype.dart';

class SixthQuest extends Quest {
	SixthQuest(user_data, quest_name) {
		this.quest_name = quest_name;
		quest_index = 6;
		exp = 1000;
		money = 1000;
		distance = 5000;
	  enemy = Arachne();
		this.user_data = user_data;
	}

}
