import 'package:flutter/material.dart';
import 'package:flutter_bookshelf_app/model/bookshelf.dart';
import 'package:flutter_bookshelf_app/provider/bookshelf_provider.dart';
import 'package:flutter_bookshelf_app/widget/bookshelf_widget.dart';
import 'package:provider/provider.dart';

import 'form_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF0F0F0),
      appBar: AppBar(
        title: const Text(
          'Bookshelf App',
        ),
      ),
      body: Consumer<BookshelfProvider>(builder: (BuildContext context,
          BookshelfProvider bookshelfProvider, Widget? child) {
        return ListView.separated(
          separatorBuilder: (context, _) => const SizedBox(
            height: 8,
          ),
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, index) {
            final bookshelf = bookshelfProvider.list[index];
            return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FormPage(
                        bookshelf: bookshelf,
                      ),
                    ),
                  );
                },
                child: BookshelfWidget(bookshelf: bookshelf));
          },
          itemCount: bookshelfProvider.list.length,
        );
      }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
        ),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FormPage(
              bookshelf: Bookshelf(),
              newItem: true,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
