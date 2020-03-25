import 'package:bloc_wall/ui/pages/widget/parallax_card.dart';
import 'package:flutter/material.dart';

final byColor = <ParallaxCardItem>[
  parallaxCardItem('grayscale', Colors.grey),
  parallaxCardItem('transparent', Colors.white.withOpacity(0)),
  parallaxCardItem('red', Colors.red),
  parallaxCardItem('orange', Colors.orange),
  parallaxCardItem('yellow', Colors.yellow),
  parallaxCardItem('green', Colors.green),
  parallaxCardItem('turquoise', Colors.blueAccent),
  parallaxCardItem('blue', Colors.blue),
  parallaxCardItem('lilac', Colors.lightBlueAccent),
  parallaxCardItem('pink', Colors.pink),
  parallaxCardItem('white', Colors.white),
  parallaxCardItem('gray', Colors.grey[100]),
  parallaxCardItem('black', Colors.black),
  parallaxCardItem('brown', Colors.brown),
];

ParallaxCardItem parallaxCardItem(
  String type,
  Color colors,
) {
  return ParallaxCardItem(
    title: type,
    body: '',
    content: '',
    imagePath: 'assets/transparent.jpg',
    colors: colors,
  );
}

final bannerCategories = <ParallaxCardItem>[
  ParallaxCardItem(
    title: '',
    body: '',
    content: 'backgrounds',
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

final bannerA = <ParallaxCardItem>[
  ParallaxCardItem(
    body: 'latest',
    title: '',
    editCho: false,
    imagePath: 'assets/latest.jpg',
  ),
  ParallaxCardItem(
    body: 'popular',
    title: '',
    editCho: false,
    imagePath: 'assets/popular.jpg',
  ),
  ParallaxCardItem(
    body: "Editor's Choice",
    title: '',
    editCho: true,
    imagePath: 'assets/random.jpg',
  ),
];

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
