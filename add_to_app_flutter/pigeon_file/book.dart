import 'package:pigeon/pigeon.dart';

class Book {
  String? title;
  Author? author;
}

class Author {
  String? name;
  int? age;
}

@HostApi()
abstract class HostBookApi {
  List<Book> search(String keyword);

  @async
  List<Book> asyncSearch(String keyword);

  @async
  Author searchWithTitle(String title);
}

@FlutterApi()
abstract class FlutterBookApi {
  void displayBookDetails(Book book);
}
