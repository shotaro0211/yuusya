import 'package:yuusya/components/quest_log.dart';
import 'package:yuusya/data/yuusya.dart';
import 'package:yuusya/data/enemys/enemy.dart';

class Battle {

	int start(Human yuusya, Enemy enemy) {
		var index = 0;
		if (yuusya.dex >= enemy.dex) {
			while (true) {
				yuusya.attack(enemy);
				if (enemy.hp <= 0) {
					index = 1;
					quest_log.add('敵を倒した。');
					break;
				}
				enemy.attack(yuusya);
				if (yuusya.hp <= 0) {
					index = 2;
					quest_log.add('勇者は死んだ。');
					break;
				}
			}
		} else {
			while (true) {
				enemy.attack(yuusya);
				if (yuusya.hp <= 0) {
					index = 2;
					quest_log.add('勇者は死んだ。');
					break;
				}
				yuusya.attack(enemy);
				if (enemy.hp <= 0) {
					index = 1;
					quest_log.add('敵を倒した。');
					break;
				}
			}
		}
		return index;
	}
}

