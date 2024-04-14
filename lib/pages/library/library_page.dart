import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
export '../library/library_page.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children:<Widget>[
          Container(
            margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
            child:TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Book Title',
                border:OutlineInputBorder(
                  borderRadius:BorderRadius.circular(10),
                  borderSide: const BorderSide(color:Colors.grey)
                )
              ),
            )
          ),
          Expanded(
        child: ListView(
          children:const [
            Card(
              child: ListTile(
                leading:FlutterLogo(size:56.0),
                title: Text('Le Petit Prince'),
                subtitle: Text('Antoine de st Exupery'),
                isThreeLine: true,
                trailing: Icon(Icons.more_vert)
              )
            )
          ],
        ),
          )
        ]

      ),
    );
  }
}
