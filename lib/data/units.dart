
class Units {

	List<Map<String, dynamic>> _documents = [
	  {
			'name': '切れたナイフ',
			'type': 'ナイフ',
			'category': '腕',
			'describe': 'よく切れるナイフ',
			'money': 100,
			'str': 3,
			'ac': 0,
			'dex': 0,
			'hp': 0,
			'rank': 'G',
		},
	  {
			'name': 'スモールソード',
			'type': '剣',
			'category': '腕',
			'describe': '短い剣',
			'money': 120,
			'str': 6,
			'ac': 0,
			'dex': 0,
			'hp': 0,
			'rank': 'G',
		},
	  {
			'name': 'ロングソード',
			'type': '剣',
			'category': '腕',
			'describe': '長い剣',
			'money': 200,
			'str': 10,
			'ac': 0,
			'dex': 0,
			'hp': 0,
			'rank': 'F',
		},
	];

	List<Map> getUnits() {

		return _documents;
	}

}
