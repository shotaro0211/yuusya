
class Enemys {

	List<Map<String, dynamic>> _documents = [
	  {
			'tribe_name': 'スライム',
			'type': '無',
			'category': 'スライム族',
			'describe': 'ただのスライム',
			'str': 100,
			'ac': 100,
			'dex': 100,
			'hp': 1000,
			'rank': 'G',
		},
		{
			'tribe_name': 'スペアー',
			'type': '無',
			'category': 'アニマル族',
			'describe': '大きなハチ',
			'str': 100,
			'ac': 100,
			'dex': 100,
			'hp': 1000,
			'rank': 'G',
		},
		{
			'tribe_name': 'ヒトノミジゴク',
			'type': '無',
			'category': '虫族',
			'describe': '人間をも飲みこむアリジゴク',
			'str': 100,
			'ac': 100,
			'dex': 100,
			'hp': 1000,
			'rank': 'G',
		},
	];

	List<Map> getEnemys() {

		return _documents;
	}

}
