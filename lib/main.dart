import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterlearn/getxImplementation/ui/ShoppingUi.dart';
import 'package:flutterlearn/login.dart';
import 'package:flutterlearn/provider/loginprovider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ShoppingUi(),
    //home: InsertDetail(),
    //home: Figma(),
  ) /*MyApp()*/);
}

/*class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  final wordpair=WordPair.random();
    return MaterialApp(
      title: "Flutter Learn List",
     home: Scaffold(
       appBar: AppBar(
         title: const Text("First App"),
       ),
       body:  Center(
         child: Text(wordpair.asPascalCase),
       ),
     ),
   );
  }
}*/

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginProvider()),
      ],
      child: MaterialApp(
        title: "Flutter Learn ListView",
        theme: ThemeData(
            primaryColor: Colors.white,
            accentColor: Colors.white,
            primaryColorDark: Colors.white),
        //home: LoginNew(),
        //home: Counter(),
        home: RandomWords(),
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomList createState() => _RandomList();
}

class _RandomwordState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    final word = WordPair.random();
    return Text(word.asPascalCase);
  }
}

class _RandomList extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _saved = <WordPair>{};
  Widget _buildList() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return const Divider();
          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(1));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair wordPair) {
    final alreadySaved = _saved.contains(wordPair);
    return ListTile(
      title: Text(
        wordPair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(wordPair);
          } else {
            _saved.add(wordPair);
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Listview"), actions: [
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved)
        ]),
        body: _buildList());
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final tiles = _saved.map(
            (WordPair pair) {
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
              );
            },
          );
          final divided = tiles.isNotEmpty
              ? ListTile.divideTiles(context: context, tiles: tiles).toList()
              : <Widget>[];

          return Scaffold(
              appBar: AppBar(
                title: Text('Favorite'),
              ),
              body: ListView(children: divided));
        },
      ),
    );
  }
}