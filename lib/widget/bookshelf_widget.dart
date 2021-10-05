import 'package:flutter/material.dart';
import 'package:flutter_bookshelf_app/model/bookshelf.dart';
import 'package:flutter_bookshelf_app/provider/bookshelf_provider.dart';
import 'package:provider/provider.dart';

import 'custom_alertdialog.dart';

class BookshelfWidget extends StatelessWidget {
  final Bookshelf bookshelf;
  const BookshelfWidget({
    required this.bookshelf,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(bookshelf.title ?? ''),
                  Text(bookshelf.yearOfBook ?? ''),
                ],
              ),
            ),
            IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => CustomAlertDialog(
                      title: 'Delete Item',
                      desc: 'Are you sure to delete this item ?',
                      onYesPressed: () {},
                    ),
                  );
                },
                icon: const Icon(
                  Icons.delete,
                ))
          ],
        ),
      ),
    );
  }
}
