class Book {
  String title, downloadUrl, authorID, description;
  List<String> quotes = [];
  List<String> saves = [];

  Book({this.title = "",
    this.downloadUrl = "",
    this.authorID = "",
    this.description = "",
    this.quotes, this.saves});

  static Book mapToBook(Map<String, dynamic> map, String key) {
    print('converting map\n$map\nto Book');
    final String authorID = map['autor'].toString();
    final String title = map['titulo'].toString();
    final String description = map['descricao'].toString();
    final String downloadUrl = map['downloadurl'].toString();
    List<dynamic> maplist = map['quotes'];
    List<dynamic> savelist = map['saves'];
    final quotes = List<String>.from(maplist);
    final saves = List<String>.from(savelist);
    return Book(
        quotes: quotes,
        downloadUrl: downloadUrl,
        description: description,
        title: title,
        authorID: authorID,
        saves: saves);
  }
}
