import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bookshelf_app/model/bookshelf.dart';
import 'package:flutter_bookshelf_app/provider/bookshelf_provider.dart';
import 'package:flutter_bookshelf_app/widget/custom_alertdialog.dart';
import 'package:provider/provider.dart';

class FormPage extends StatefulWidget {
  Bookshelf bookshelf;
  bool newItem;
  FormPage({required this.bookshelf, this.newItem = false, Key? key})
      : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController? _title = TextEditingController();
  final TextEditingController? _yearOfBook = TextEditingController();
  final TextEditingController? _synopsis = TextEditingController();
  late bool newItem;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _title?.text = widget.bookshelf.title ?? '';
    _yearOfBook?.text = widget.bookshelf.yearOfBook ?? '';
    _synopsis?.text = widget.bookshelf.synopsis ?? '';
    newItem = widget.newItem;
  }

  @override
  Widget build(BuildContext context) {
    Widget buildTitle() => TextFormField(
          controller: _title,
          validator: (title) {
            if (title!.isEmpty) {
              return 'The title cannot be Empty';
            }
            return null;
          },
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            labelText: 'Title',
          ),
        );
    Widget buildYear() => TextFormField(
          controller: _yearOfBook,
          validator: (yearOfBook) {
            if (yearOfBook!.isEmpty) {
              return 'The year of book cannot be Empty';
            }
            return null;
          },
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            labelText: 'Year of Book',
          ),
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
        );
    Widget buildSynopsis() => TextFormField(
          controller: _synopsis,
          maxLines: 2,
          validator: (synopsis) {
            if (synopsis!.isEmpty) {
              return 'The synopsis cannot be Empty';
            }
            return null;
          },
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            labelText: 'Synopsis',
          ),
        );
    Widget buildButton() => SizedBox(
          width: 100,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                newItem
                    //Jika tambah baru
                    ? showDialog(
                        context: context,
                        builder: (BuildContext context) => CustomAlertDialog(
                          title: 'Add Item',
                          desc: 'Are you sure to add this item ?',
                          onYesPressed: () {},
                        ),
                      )
                    //Jika edit yang sudah ada
                    : showDialog(
                        context: context,
                        builder: (BuildContext context) => CustomAlertDialog(
                          title: 'Save Item',
                          desc: 'Are you sure to save this item ?',
                          onYesPressed: () {},
                        ),
                      );
              }
            },
            child: const Text('SAVE'),
          ),
        );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Fill This Form',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              buildTitle(),
              buildYear(),
              buildSynopsis(),
              const SizedBox(
                height: 30,
              ),
              buildButton(),
            ],
          ),
        ),
      ),
    );
  }
}
