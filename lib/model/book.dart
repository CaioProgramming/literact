class Book {
  String title, downloadUrl, authorID, description;
  List<String> quotes;

  Book(
      {this.title,
      this.downloadUrl,
      this.authorID,
      this.description,
      this.quotes});

  static Book mapToBook(Map<String, dynamic> map, String key) {
    print('converting map\n$map\nto Book');
    final String authorID = map['autor'].toString();
    final String title = map['titulo'].toString();
    final String description = map['descricao'].toString();
    final String downloadUrl = map['downloadurl'].toString();
    List<dynamic> maplist = map['quotes'];
    final quotes = List<String>.from(maplist);
    return Book(
        quotes: quotes,
        downloadUrl: downloadUrl,
        description: description,
        title: title,
        authorID: authorID);
  }
}
