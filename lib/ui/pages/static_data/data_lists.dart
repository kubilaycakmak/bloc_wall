import 'package:bloc_wall/ui/pages/widget/parallax_card.dart';
import 'package:flutter/material.dart';

final byColor = <ParallaxCardItem>[
  parallaxCardItem(
      type: 'Grayscale',
      content: 'latest',
      colors: Colors.grey[300],
      categories: '',
      path: 'transparent',
      color: 'grayscale'),
  parallaxCardItem(
      type: 'Transparent',
      content: 'latest',
      colors: Colors.white.withOpacity(0),
      categories: '',
      path: 'transparent',
      color: 'transparent'),
  parallaxCardItem(
      type: 'Red',
      content: 'latest',
      colors: Colors.red,
      categories: '',
      path: 'transparent',
      color: 'red'),
  parallaxCardItem(
      type: 'Orange',
      content: 'latest',
      colors: Colors.orange,
      categories: '',
      path: 'transparent',
      color: 'orange'),
  parallaxCardItem(
      type: 'Yellow',
      content: 'latest',
      colors: Colors.yellow,
      categories: '',
      color: 'yellow'),
  parallaxCardItem(
      type: 'Green',
      content: 'latest',
      colors: Colors.green,
      categories: '',
      path: 'transparent',
      color: 'green'),
  parallaxCardItem(
      type: 'Turquoise',
      content: 'latest',
      colors: Colors.lightBlueAccent,
      categories: '',
      path: 'transparent',
      color: 'turqouise'),
  parallaxCardItem(
      type: 'Blue',
      content: 'latest',
      colors: Colors.blue,
      categories: '',
      path: 'transparent',
      color: 'blue'),
  parallaxCardItem(
      type: 'Lilac',
      content: 'latest',
      colors: Colors.purpleAccent,
      categories: '',
      color: 'lilac'),
  parallaxCardItem(
      type: 'Pink',
      content: 'latest',
      colors: Colors.pink,
      categories: '',
      path: 'transparent',
      color: 'pink'),
  parallaxCardItem(
      type: 'White',
      content: 'latest',
      colors: Colors.white,
      categories: '',
      path: 'transparent',
      color: 'white'),
  parallaxCardItem(
      type: 'Gray',
      content: 'latest',
      colors: Colors.grey[900],
      categories: '',
      path: 'transparent',
      color: 'gray'),
  parallaxCardItem(
      type: 'Black',
      content: 'latest',
      colors: Colors.black,
      categories: '',
      path: 'transparent',
      color: 'black'),
  parallaxCardItem(
      type: 'Brown',
      content: 'latest',
      colors: Colors.brown,
      categories: '',
      path: 'transparent',
      color: 'brown'),
];

ParallaxCardItem parallaxCardItem({
  String type,
  bool editorChoice,
  Color colors,
  String color,
  String path,
  String content,
  String categories,
}) {
  return ParallaxCardItem(
    title: type,
    body: '',
    content: content,
    imagePath: path == 'transparent' ? 'assets/$path.png' : 'assets/$path.jpg',
    colors: colors,
    imageType: 'all',
    categories: categories,
    editCho: editorChoice,
    color: color,
  );
}

final bannerA = <ParallaxCardItem>[
  parallaxCardItem(
      type: 'Latest',
      content: 'latest',
      colors: Colors.transparent,
      path: 'latest',
      categories: '',
      editorChoice: false),
  parallaxCardItem(
      type: 'Popular',
      content: 'popular',
      colors: Colors.transparent,
      path: 'popular',
      categories: '',
      editorChoice: false),
  // parallaxCardItem(
  //     type: "Editor's Choice",
  //     content: 'latest',
  //     colors: Colors.transparent,
  //     path: 'editorChoice',
  //     categories: '',
  //     editorChoice: true),
];

final bannerCategories1 = <ParallaxCardItem>[
  parallaxCardItem(
      type: 'Backgrounds',
      colors: Colors.transparent,
      categories: 'background',
      path: 'background',
      content: 'latest',
      editorChoice: true),
  parallaxCardItem(
      type: 'Fashion',
      colors: Colors.transparent,
      categories: 'fashion',
      path: 'fashion',
      content: 'latest',
      editorChoice: true),
  parallaxCardItem(
      type: 'Nature',
      colors: Colors.transparent,
      categories: 'nature',
      path: 'nature',
      content: 'latest',
      editorChoice: true),
  parallaxCardItem(
      type: 'Science',
      colors: Colors.transparent,
      categories: 'science',
      path: 'science',
      content: 'latest',
      editorChoice: true),
  parallaxCardItem(
      type: 'Education',
      colors: Colors.transparent,
      categories: 'education',
      path: 'education',
      content: 'latest',
      editorChoice: true),
  parallaxCardItem(
      type: 'Feel',
      colors: Colors.transparent,
      categories: 'feel',
      path: 'feel',
      content: 'latest',
      editorChoice: true),
  parallaxCardItem(
      type: 'Health',
      colors: Colors.transparent,
      categories: 'health',
      path: 'health',
      content: 'latest',
      editorChoice: true),
  parallaxCardItem(
      type: 'People',
      colors: Colors.transparent,
      categories: 'people',
      path: 'people',
      content: 'latest',
      editorChoice: true),
  parallaxCardItem(
      type: 'Religions',
      colors: Colors.transparent,
      categories: 'religions',
      path: 'regions',
      content: 'latest',
      editorChoice: true),
  parallaxCardItem(
      type: 'Places',
      colors: Colors.transparent,
      categories: 'places',
      path: 'places',
      content: 'latest',
      editorChoice: true),
  parallaxCardItem(
      type: 'Animal',
      colors: Colors.transparent,
      categories: 'animal',
      path: 'animal',
      content: 'latest',
      editorChoice: true),
  parallaxCardItem(
      type: 'Factory',
      colors: Colors.transparent,
      categories: 'factory',
      path: 'factory',
      content: 'latest',
      editorChoice: true),
  parallaxCardItem(
      type: 'Computer',
      colors: Colors.transparent,
      categories: 'computer',
      path: 'computer',
      content: 'latest',
      editorChoice: true),
  parallaxCardItem(
      type: 'Food',
      colors: Colors.transparent,
      categories: 'food',
      path: 'food',
      content: 'latest',
      editorChoice: true),
  parallaxCardItem(
      type: 'Sports',
      colors: Colors.transparent,
      categories: 'sports',
      path: 'sports',
      content: 'latest',
      editorChoice: true),
  parallaxCardItem(
      type: 'Transportation',
      colors: Colors.transparent,
      categories: 'transportation',
      path: 'transportation',
      content: 'latest',
      editorChoice: true),
  parallaxCardItem(
      type: 'Travel',
      colors: Colors.transparent,
      categories: 'travel',
      path: 'travel',
      content: 'latest',
      editorChoice: true),
  parallaxCardItem(
      type: 'Buildings',
      colors: Colors.transparent,
      categories: 'buildings',
      path: 'buildings',
      content: 'latest',
      editorChoice: true),
  parallaxCardItem(
      type: 'Business',
      colors: Colors.transparent,
      categories: 'business',
      path: 'business',
      content: 'latest',
      editorChoice: true),
  parallaxCardItem(
      type: 'Music',
      colors: Colors.transparent,
      categories: 'music',
      path: 'music',
      content: 'latest',
      editorChoice: true),
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
