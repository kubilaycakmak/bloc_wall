import 'package:bloc_wall/ui/pages/widget/parallax_card.dart';
import 'package:flutter/material.dart';

final byColor = <ParallaxCardItem>[
  parallaxCardItem('grayscale', Colors.grey, ''),
  parallaxCardItem('transparent', Colors.white.withOpacity(0), 'transparent'),
  parallaxCardItem('red', Colors.red, ''),
  parallaxCardItem('orange', Colors.orange, ''),
  parallaxCardItem('yellow', Colors.yellow, ''),
  parallaxCardItem('green', Colors.green, ''),
  parallaxCardItem('turquoise', Colors.blueAccent, ''),
  parallaxCardItem('blue', Colors.blue, ''),
  parallaxCardItem('lilac', Colors.lightBlueAccent, ''),
  parallaxCardItem('pink', Colors.pink, ''),
  parallaxCardItem('white', Colors.white, ''),
  parallaxCardItem('gray', Colors.grey[100], ''),
  parallaxCardItem('black', Colors.black, ''),
  parallaxCardItem('brown', Colors.brown, ''),
];

ParallaxCardItem parallaxCardItem(
  String type,
  Color colors,
  String path,
) {
  return ParallaxCardItem(
    title: type,
    body: '',
    content: '',
    imagePath: 'assets/$path.jpg',
    colors: colors,
  );
}

ParallaxCardItem parallaxCardItemColors(
  String type,
  Color colors,
) {
  return ParallaxCardItem(
    title: type,
    body: '',
    content: '',
    imagePath: '',
    colors: colors,
  );
}
final bannerA = <ParallaxCardItem>[
  parallaxCardItem('Latest', Colors.transparent, 'latest'),
  parallaxCardItem('Popular', Colors.transparent, 'popular'),
  parallaxCardItem("Editor's Choice", Colors.transparent, 'editorChoice'),
];

  // final bannerA = <SlidingCard>[
  //   _slidingCard('Latest', 'latest.jpg'),
  //   _slidingCard('Popular', 'popular.jpg'),
  //   _slidingCard("Editor's Choice", 'editorChoice.jpg'),
  // ];

  // SlidingCard _slidingCard(String name, String path) {
  //   return SlidingCard(
  //     name: name,
  //     assetName: path,
  //     offset: 1,
  //   );
  // }
  // SlidingCard _slidingCard2(String name, String path) {
  //   return SlidingCard(
  //     name: name,
  //     assetName: path,
  //     offset: 1,
  //   );
  // }
  final bannerCategories1 = <ParallaxCardItem>[
  ParallaxCardItem(
    title: 'backgrounds',
    body: '',
    content: '',
    imagePath: 'assets/background.jpg',
  ),
  ParallaxCardItem(
    title: 'fashion',
    body: '',
    imagePath: 'assets/fashion.jpg',
  ),
  ParallaxCardItem(
    title: 'nature',
    body: '',
    imagePath: 'assets/nature.jpg',
  ),
  ParallaxCardItem(
    title: 'science',
    body: '',
    imagePath: 'assets/science.jpg',
  ),
  ParallaxCardItem(
    title: 'education',
    body: '',
    imagePath: 'assets/education.jpg',
  ),
  ParallaxCardItem(
    title: 'feelings',
    body: '',
    imagePath: 'assets/feel.jpg',
  ),
  ParallaxCardItem(
    title: 'health',
    body: '',
    imagePath: 'assets/health.jpg',
  ),
  ParallaxCardItem(
    title: 'people',
    body: '',
    imagePath: 'assets/people.jpg',
  ),
  ParallaxCardItem(
    title: 'religion',
    body: '',
    imagePath: 'assets/regions.jpg',
  ),
  ParallaxCardItem(
    title: 'places',
    body: '',
    imagePath: 'assets/places.jpg',
  ),
  ParallaxCardItem(
    title: 'animals',
    body: '',
    imagePath: 'assets/animal.jpg',
  ),
  ParallaxCardItem(
    title: 'industry',
    body: '',
    imagePath: 'assets/factory.jpg',
  ),
  ParallaxCardItem(
    title: 'computer',
    body: '',
    imagePath: 'assets/computer.jpg',
  ),
  ParallaxCardItem(
    title: 'food',
    body: '',
    imagePath: 'assets/food.jpg',
  ),
  ParallaxCardItem(
    title: 'sports',
    body: '',
    imagePath: 'assets/sports.jpg',
  ),
  ParallaxCardItem(
    title: 'transportation',
    body: '',
    imagePath: 'assets/transportation.jpg',
  ),
  ParallaxCardItem(
    title: 'travel',
    body: '',
    imagePath: 'assets/travel.jpg',
  ),
  ParallaxCardItem(
    title: 'buildings',
    body: '',
    imagePath: 'assets/buildings.jpg',
  ),
  ParallaxCardItem(
    title: 'business',
    body: '',
    imagePath: 'assets/business.jpg',
  ),
  ParallaxCardItem(
    title: 'music',
    body: '',
    imagePath: 'assets/music.jpg',
  ),
];


// final bannerCategories = <SlidingCard>[
//   _slidingCard2('Backgrounds', 'background.jpg'),
//   _slidingCard2('Fashion', 'fashion.jpg'),
//   _slidingCard2('Nature', 'nature.jpg'),
//   _slidingCard2('Science', 'science.jpg'),
//   _slidingCard2('Education', 'education.jpg'),
//   _slidingCard2('Feelings', 'feel.jpg'),
//   _slidingCard2('Health', 'health.jpg'),
//   _slidingCard2('People', 'people.jpg'),
//   _slidingCard2('Religion', 'regions.jpg'),
//   _slidingCard2('Places', 'places.jpg'),
//   _slidingCard2('Animal', 'animal.jpg'),
//   _slidingCard2('Factory', 'factory.jpg'),
//   _slidingCard2('Computer', 'computer.jpg'),
//   _slidingCard2('Food', 'food.jpg'),
//   _slidingCard2('Sports', 'sports.jpg'),
//   _slidingCard2('Transportation', 'transportation.jpg'),
//   _slidingCard2('Travel', 'travel.jpg'),
//   _slidingCard2('Buildings', 'buildings.jpg'),
//   _slidingCard2('Business', 'business.jpg'),
//   _slidingCard2('Music', 'music.jpg'),
// ];


final bannerPhoto = <ParallaxCardItem>[
  ParallaxCardItem(
    title: 'Tap to Explore',
    body: 'Photo',
    imageType: 'photo',
    imagePath: 'assets/photo.jpg',
  ),
];
final bannerVector = <ParallaxCardItem>[
  ParallaxCardItem(
    title: 'Tap to Explore',
    body: 'Vector',
    imageType: 'vector',
    imagePath: 'assets/vector.png',
  ),
];
final bannerIllistration = <ParallaxCardItem>[
  ParallaxCardItem(
    title: 'Tap to Explore',
    body: 'Illustration',
    imageType: 'illustration',
    imagePath: 'assets/illustration.jpg',
  ),
];
final List photoOrVideoList = ['Photo', 'Video'];
