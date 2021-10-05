import 'package:flutter/material.dart';
import 'package:flutter_bookshelf_app/provider/bookshelf_provider.dart';
import 'package:provider/provider.dart';
import 'page/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BookshelfProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
