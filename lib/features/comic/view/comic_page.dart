import 'package:flutter/material.dart';
import 'package:story/features/comic/view/detail_comic.dart';

class ComicPage extends StatefulWidget {
  const ComicPage({super.key});

  @override
  State<ComicPage> createState() => _ComicPageState();
}

class _ComicPageState extends State<ComicPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailComic()),
            );
          },
          child: Text('data'),
        ),
      ),
    );
  }
}
