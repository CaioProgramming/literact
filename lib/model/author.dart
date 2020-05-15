class Author {
  String name, picUrl, id;

  Author({this.name, this.picUrl, this.id});

  static Author mapToAuthor(Map<String, dynamic> map, String key) {
    print('converting map\n$map\nto Author');
    final String name = map['nome'].toString();
    final String authorpicURL = map['authorpic'].toString();
    return Author(
      name: name,
      picUrl: authorpicURL,
      id: key,
    );
  }
}
