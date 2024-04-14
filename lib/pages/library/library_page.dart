import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_first_app/domain/book_repository/models/book_model.dart';
export '../library/library_page.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {

  List<Book> books = allBooks;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children:<Widget>[
          Container(
            margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
            child:TextField(
              style: TextStyle(height: 1),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Book Title',
                focusColor:Colors.grey,
                border:OutlineInputBorder(
                  borderRadius:BorderRadius.circular(10),
                  borderSide: const BorderSide(color:Color.fromARGB(255, 228, 226, 226))
                )
              ),
              onChanged: searchBook,
            )
          ),
          Expanded(
        child: ListView.builder(
          itemCount: books.length,
          itemBuilder: (context,index){
            final book = books[index];

            return Card(
              child: ListTile(
                leading: Image.asset(
                  book.urlImage,
                  fit:BoxFit.cover,
                  width:50,
                  height:50
                  ),
                title: Text(book.title),
                subtitle: Text(book.author),
                isThreeLine: true,
                trailing: const Icon(Icons.more_vert)
              ),      
            );
          },
        ),
          )
        ]

      ),
    );
  }

  void searchBook(String query){
    final suggestions = allBooks.where((book){
      final bookTitle = book.title.toLowerCase();
      final input = query.toLowerCase();

      return bookTitle.contains(input); 
    }).toList();

    setState(() {
      books=suggestions;
    });
  }
}

