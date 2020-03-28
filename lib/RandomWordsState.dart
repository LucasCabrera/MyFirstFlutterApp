import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'RandomWords.dart';

class RandomWordsState extends State<RandomWords>
{
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar
        (
        title: Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions()
  {
    var countItems = 27;
    return ListView.builder
      (
        padding: const EdgeInsets.all(16.0),
        itemCount: countItems,
        itemBuilder: /*1*/ (context, i)
        {
          if (i >= _suggestions.length)
          {
            _suggestions.addAll(generateWordPairs().take(countItems)); /*4*/
          }
          return _buildRow(_suggestions[i]);
        }
    );
  }

  Widget _buildRow(WordPair pair) {
    return ListTile
      (
      title: Text
        (
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }

}