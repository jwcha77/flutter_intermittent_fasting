const int kHours8 = 28800;
const int kHours16 = 57600;

class MyImages {
  MyImages._();

  static const intermittentFasting = 'assets/images/intermittent_fasting.jpg';
  static const intermittentFasting2 = 'assets/images/intermittent_fasting2.jpg';

  static const water = 'assets/icons/water.png';
  static const coffee = 'assets/icons/coffee.png';
  static const bulletCoffee = 'assets/icons/bullet_coffee.png';
  static const tea = 'assets/icons/tea.png';
  static const nutrients = 'assets/icons/nutrients.png';
  static const boneBroth = 'assets/icons/bone_broth.png';
  static const chocolate = 'assets/icons/chocolate.png';
  static const vegetable = 'assets/icons/vegetable.png';
  static const psylliumHuskPowder = 'assets/icons/psyllium_husk_powder.png';
  static const pinkSalt = 'assets/icons/pink_salt.png';
  static const appleCiderVinegar = 'assets/icons/apple_cider_vinegar.png';
  static const chiaSeeds = 'assets/icons/chia_seeds.png';
}

const List<({String title, String content, List<String> targetString})> thingsToKeepInMind3 = [
  (
    title: '1. Avoid Binge-Eating and Reduce Carbohydrate Intake During Meals',
    content: '''If you are practicing intermittent fasting for weight loss, it's a good idea to reduce excessive calorie intake and high-sugar foods even during non-fasting hours.\n\nReducing carbohydrate intake is essential to experience the insulin secretion reduction effect of intermittent fasting, and it's important to consume an adequate amount of protein to prevent muscle loss.''',
    targetString: ['Reduce excessive calorie intake and high-sugar foods', 'carbohydrate', 'protein'],
  ),
  (
    title: '''2. Very Low-Calorie Intake Isn't Recommended''',
    content: '''Consuming excessively low calories during the fasting period can lower basal metabolic rate and may lead to muscle loss.\n\nIt can also affect hormones, so it's recommended to consume around 800kcal even on fasting days.''',
    targetString: ['''It can lower basal metabolic rate and may lead to muscle loss.''', '''It's recommended to consume around 800kcal even on fasting days.'''],
  ),
  (
    title: '3. Find a Fasting Time and Method That Suits Your Body',
    content: '''Rather than fixating on the fasting period, it's a good idea to establish meal and fasting times based on your own circadian rhythm and daily activities.\n\nIf you have any health issues, it's advisable to consult with a specialist before starting.''',
    targetString: ['''based on your own circadian rhythm and daily activities''', '''It's advisable to consult with a specialist if you have any health issues.'''],
  ),
];
const List<({String title, String content, List<String> targetString})> frequentlyAskedQuestions = [
  (
    title: 'Can I Drink Liquids While Fasting?',
    content: '''Yes. Water, coffee, tea, and other zero-calorie beverages are fine. Avoid adding sugar to coffee, and a small amount of milk or cream is acceptable.\n\nCoffee can help curb hunger, especially during fasting.''',
    targetString: [],
  ),
  (
    title: 'Is Skipping Breakfast Unhealthy?',
    content: '''No. The problem is that most people who skip typical breakfasts tend to have an unhealthy lifestyle.\n\nHaving healthy meals throughout the day is good for your health.''',
    targetString: [],
  ),
  (
    title: 'Can I Take Supplements During Fasting?',
    content: '''Yes. However, some supplements, such as fat-soluble vitamins, may be more effective when taken with meals.''',
    targetString: [],
  ),
  (
    title: 'Is It Okay to Exercise While Fasting?',
    content: '''Yes, fasting exercise is recommended. Some people recommend taking branched-chain amino acids (BCAA) before fasting exercise.''',
    targetString: [],
  ),
  (
    title: 'Does Fasting Cause Muscle Loss?',
    content: '''All weight loss methods can potentially lead to muscle loss, so it's essential to maintain a high protein intake. According to one study, intermittent fasting results in less muscle loss than regular calorie restriction.''',
    targetString: [],
  ),
  (
    title: 'Does Fasting Slow Down My Metabolism?',
    content: '''No. Research shows that short-term fasting actually promotes metabolism. However, prolonged fasts of over 3 days can potentially suppress metabolism.''',
    targetString: [],
  ),
];

final List<AllowedFood> allowedFoods = [
  AllowedFood(
    title: 'WATER',
    image: MyImages.water,
    content: [
      'Pure water is the only food that is 100% safe to consume during fasting.',
      'Adequate water intake is essential for detoxification and survival, so make sure to drink enough.',
      'Drinking 500ml of water can satisfy the brain\'s hunger.',
      'The brain often confuses thirst for hunger, so when you feel hungry, try drinking water first.',
    ],
  ),
  AllowedFood(
    title: 'COFFEE',
    image: MyImages.coffee,
    content: [
      'Caffeine is known to have an "appetite-suppressing effect." However, according to the [American College of Nutrition 2012 (Research Purpose: Coffee\'s Weight Loss Effect)], "decaffeinated coffee" was found to provide a greater sense of fullness than regular coffee with caffeine.',
      'This research suggests that the appetite-suppressing effect of coffee is not due to "caffeine." When you drink coffee, your appetite is suppressed, and hunger is alleviated because of an increase in the hormone "Peptide YY."',
      '"Peptide YY" is a hormone secreted in the intestines. This hormone reduces "appetite" and "hunger."',
      'Therefore, for those who are concerned that the "caffeine component" in regular black coffee may stimulate insulin and potentially break fasting, decaffeinated coffee can be a good alternative.',
      'If you are sensitive to coffee and even drinking coffee alone prevents you from sleeping at night, the caffeine in black coffee can also stimulate insulin and break your fast on an empty stomach. For such individuals, this research may be of particular interest. Consider using "decaffeinated" coffee.',
      'If you do choose to consume regular black coffee during your fasting period, it is recommended to have 1-2 cups.',
    ],
  ),
  AllowedFood(
    title: 'BULLET COFFEE',
    image: MyImages.bulletCoffee,
    content: [
      'The key to intermittent fasting is not to stimulate insulin and blood sugar levels during fasting.',
      'Among nutrients, fat is known to barely stimulate insulin secretion.',
      'There are many research results that suggest it provides a sense of fullness and does not break the fast, so it may be a good option for those planning an extended fast.',
      'While there are various research results, for those who find it difficult to access academic papers, you can visit the YouTube channel "2 Fit Docs" and watch related videos. The channel is run by a doctor couple who experiment on their own bodies by eating various foods and testing if they break their fast. Of course, not all of the findings may apply to everyone, but these videos are informative.',
    ],
  ),
  AllowedFood(
    title: 'TEA',
    image: MyImages.tea,
    content: [
      'Tea contains antioxidant components and has a mild appetite-suppressing effect.',
      'For herbal teas made from traditional Korean medicine ingredients, they have effects such as strengthening blood sugar, suppressing appetite, boosting the immune system, and promoting anti-aging.',
      'It is recommended to limit consumption to 1-2 cups per day.',
    ],
  ),
  AllowedFood(
    title: 'NUTRIENTS',
    image: MyImages.nutrients,
    content: [
      'Nutritional supplements can be helpful, but fat-soluble nutrients (such as omega-3, fat-soluble vitamins, etc.) can cause digestive problems when taken on an empty stomach.',
      'Therefore, it is advisable to understand this in advance, and only those who are aiming for a prolonged fast of 48 hours or more should consider taking necessary supplements.',
    ],
  ),
  AllowedFood(
    title: 'BONE BROTH',
    image: MyImages.boneBroth,
    content: [
      'Bone broth is a very useful food for those who are fasting for an extended period.',
      'Consuming bone broth once a day can supplement the essential proteins, fats, and minerals our body needs.',
      'When you consume it, adding salt can help alleviate symptoms such as headaches, dizziness, and dehydration.',
    ],
  ),
  AllowedFood(
    title: 'CHOCOLATE',
    image: MyImages.chocolate,
    content: [
      'It allows you to easily consume high-quality fats.',
      'If you usually have a high carbohydrate diet or are not accustomed to fat metabolism in the early stages of fasting, it is not recommended.',
    ],
  ),
  AllowedFood(
    title: 'VEGETABLE',
    image: MyImages.vegetable,
    content: [
      'It provides a sense of fullness.',
      'It promotes the elimination of waste in the intestines.',
    ],
  ),
  AllowedFood(
    title: 'PSYLLIUM HUSK POWDER',
    image: MyImages.psylliumHuskPowder,
    content: [
      'It is helpful for dieting as it is rich in dietary fiber and provides a sense of fullness when consumed with water.',
    ],
  ),
  AllowedFood(
    title: 'PINK SALT',
    image: MyImages.pinkSalt,
    content: [
      'It supplements the lack of minerals during fasting and helps improve symptoms such as dizziness and headaches.',
    ],
  ),
  AllowedFood(
    title: 'APPLE CIDER VINEGAR',
    image: MyImages.appleCiderVinegar,
    content: [
      'Decreases Blood Sugar',
      'Decreases Insulin Levels',
      'Lowers Fasting Blood Sugar',
      'Suppresses Appetite',
      'Improves Insulin Sensitivity',
      'Decreases Belly Fat',
      'Supports Gut Health and reduces intestinal gas.',
    ],
  ),
  AllowedFood(
    title: 'CHIA SEEDS',
    image: MyImages.chiaSeeds,
    content: [
      '"Chia seeds" provide a sense of fullness and contain 15 times more omega-3 content than salmon.',
      'They contain 37.7g of dietary fiber per 100g.',
      'To consume, wash about 3 tablespoons (15g) of chia seeds thoroughly and soak them in water for about 30 minutes before eating. You can also consume them with water or carbonated water.',
    ],
  )
];

class AllowedFood {
  final String title;
  final String image;
  final List<String> content;
  AllowedFood({
    required this.title,
    required this.image,
    required this.content,
  });
}
