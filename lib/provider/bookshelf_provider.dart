import 'package:flutter/widgets.dart';
import 'package:flutter_bookshelf_app/model/bookshelf.dart';

class BookshelfProvider extends ChangeNotifier {
  final List<Bookshelf> _list = [
    Bookshelf(
      title: 'Judu1',
      yearOfBook: '1234',
      synopsis: 'Sinopsis',
    ),
    Bookshelf(
      title: 'Judul2',
      yearOfBook: '1234',
      synopsis: 'Sinopsis',
    ),
    Bookshelf(
      title: 'Judul3',
      yearOfBook: '1234',
      synopsis: 'Sinopsis',
    ),
    Bookshelf(
      title: 'Judul4',
      yearOfBook: '1234',
      synopsis: 'Sinopsis',
    ),
    Bookshelf(
      title: 'Judul5',
      yearOfBook: '1234',
      synopsis: 'Sinopsis',
    ),
    Bookshelf(
      title: 'Judul6',
      yearOfBook: '1234',
      synopsis: 'Sinopsis',
    ),
    Bookshelf(
      title: 'Judul7',
      yearOfBook: '1234',
      synopsis: 'Sinopsis',
    ),
    Bookshelf(
      title: 'Judul8',
      yearOfBook: '1234',
      synopsis: 'Sinopsis',
    ),
  ];

  List<Bookshelf> get list => _list.toList();
}
