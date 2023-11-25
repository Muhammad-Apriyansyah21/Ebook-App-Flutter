class BookList {
  String imageUrl;
  String writers;
  String title;

  BookList(
      {required this.imageUrl, required this.writers, required this.title});
}

List<BookList> bookLists = [
  BookList(
      imageUrl: 'assets/images/trendingbook_1.png',
      writers: 'Guy Kawasaki',
      title: 'Enchantment'),
  BookList(
      imageUrl: 'assets/images/trendingbook_2.png',
      writers: 'Aaron Mahnke',
      title: 'LORE'),
  BookList(
      imageUrl: 'assets/images/trendingbook_3.png',
      writers: 'Spencer Johnson, M.D',
      title: 'Who Moved My Cheese'),
];
