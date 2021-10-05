import 'package:flutter/widgets.dart';
import 'package:flutter_bookshelf_app/model/bookshelf.dart';

class BookshelfProvider extends ChangeNotifier {
  final List<Bookshelf> _list = [];

  List<Bookshelf> get list => _list.toList();

  void addNewItem(String title, String year, String synopsis){
    _list.add(Bookshelf(title: title, yearOfBook: year, synopsis: synopsis));
    notifyListeners();
  }

  void deteleItem(String title) {
    _list.removeWhere((book) => book.title == title);
    notifyListeners();
  }

  void editItem(Bookshelf bookshelf, String title, String year, String synopsis){
    int index = _list.indexOf(bookshelf);
    _list[index].title = title;
    _list[index].yearOfBook = year;
    _list[index].synopsis = synopsis;
    notifyListeners();
  }
}
