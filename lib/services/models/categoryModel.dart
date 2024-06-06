// Model for ImageItem
class ImageItem {
  final String name;
  final String imagePath;

  ImageItem({required this.name, required this.imagePath});
}

// Model for Category
class Category {
  final int id;
  final List<ImageItem> images;

  Category({required this.id, required this.images});
}

// List of Categories (Replace with your actual data)
List<Category> categories = [
  Category(
    id: 1,
    images: [
      ImageItem(name: 'Belgium Waffle', imagePath: 'assets/images/img_belgiumWaffle.jpg'),
      ImageItem(name: 'N-Block', imagePath: 'assets/images/img_nBlock.jpg'),
      ImageItem(name: 'Belgium Waffle', imagePath: 'assets/images/img_belgiumWaffle.jpg'),
      ImageItem(name: 'N-Block', imagePath: 'assets/images/img_nBlock.jpg'),
      ImageItem(name: 'Belgium Waffle', imagePath: 'assets/images/img_belgiumWaffle.jpg'),
      ImageItem(name: 'N-Block', imagePath: 'assets/images/img_nBlock.jpg'),
      ImageItem(name: 'Belgium Waffle', imagePath: 'assets/images/img_belgiumWaffle.jpg'),
      ImageItem(name: 'N-Block', imagePath: 'assets/images/img_nBlock.jpg'),
    ],
  ),
  Category(
    id: 2,
    images: [
      ImageItem(name: 'N-Block', imagePath: 'assets/images/img_nBlock.jpg'),
    ],
  ),
  // Add more categories as needed
];