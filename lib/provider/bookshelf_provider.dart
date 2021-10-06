import 'package:flutter/widgets.dart';
import 'package:flutter_bookshelf_app/model/bookshelf.dart';

class BookshelfProvider extends ChangeNotifier {
  final List<Bookshelf> _list = [];

  List<Bookshelf> get list => _list.toList();

  void addNewItem(String title, String year, String synopsis) {
    _list.add(Bookshelf(title: title, yearOfBook: year, synopsis: synopsis));
    notifyListeners();
  }

  void deteleItem(Bookshelf book) {
    _list.remove(book);
    notifyListeners();
  }

  void editItem(
    Bookshelf bookshelf,
    String title,
    String year,
    String synopsis,
  ) {
    bookshelf.title = title;
    bookshelf.yearOfBook = year;
    bookshelf.synopsis = synopsis;
    notifyListeners();
  }
}
