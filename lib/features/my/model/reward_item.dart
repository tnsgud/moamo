enum Rarity {
  normal('노말'),
  rare('레어'),
  unique('유니크');

  const Rarity(this.label);

  final String label;
}

class RewardItem {
  const RewardItem({required this.name, required this.rarity});

  final String name;
  final Rarity rarity;
}

// TODO: 서버 데이터로 교체
const rewardCatalog = [
  RewardItem(name: '새싹 머리띠', rarity: Rarity.normal),
  RewardItem(name: '새싹 미니북', rarity: Rarity.normal),
  RewardItem(name: '새싹 연필', rarity: Rarity.normal),
  RewardItem(name: '머그컵', rarity: Rarity.normal),
  RewardItem(name: '보부상 가방', rarity: Rarity.rare),
  RewardItem(name: '달력', rarity: Rarity.rare),
  RewardItem(name: '책', rarity: Rarity.rare),
  RewardItem(name: '새싹 인형', rarity: Rarity.rare),
  RewardItem(name: '독서 헤드폰', rarity: Rarity.rare),
  RewardItem(name: '미니 구름', rarity: Rarity.rare),
  RewardItem(name: '마법 물약', rarity: Rarity.rare),
  RewardItem(name: '칭찬 별', rarity: Rarity.unique),
];
