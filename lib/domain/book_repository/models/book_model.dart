class Book{
  final String title;
  final String author;
  final String urlImage;

  const Book({
    required this.title,
    required this.author,
    required this.urlImage
  });
}

  const allBooks=[
    Book(
      title: 'Le Petit Prince',
      author: 'Antoine de st Exupery',
      urlImage: 'assets/images/petit-prince.jpg'
      ),
      Book(
      title: 'Le Chemin de la vie',
      author: 'Zacharias Tanee Fomum',
      urlImage: 'assets/images/petit-prince.jpg'
      )
  ];