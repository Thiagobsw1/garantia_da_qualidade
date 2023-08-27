import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'dart:html';



const String questao1 = '''

''';

const String questao2 = '''
    
''';

const String questao3 = '''
''';

const String questao4 = '''
      
''';
const String questao5 = '''
'''
;



class Unidade2 extends StatelessWidget {
  const Unidade2({super.key});

  @override
  Widget build(BuildContext context) {    
    
    return ListView.builder(
      itemBuilder: (BuildContext, int index) =>  EntryItem(data[index]),
      itemCount: data.length,
      );
  }
}

class Entry{
  Entry(this.title, [this.children = const <Entry>[]]);
  String title;
  List<Entry> children;
}


List<Entry> data = <Entry>[
  Entry(
    'Unidade 2',
    <Entry>[
      Entry(
        'Aula 1',
        <Entry>[

        Entry(
          'Questão 1',
          <Entry>[
            Entry(questao1)            
          ]
          ),

        Entry(
          'Questão 2',
          <Entry>[
            Entry(questao2)            
          ]
          ),

          Entry(
          'Questão 3',
          <Entry>[
            Entry(questao3)            
          ]
          ),

          Entry(
          'Questão 4',
          <Entry>[
            Entry(questao4)            
          ]
          ),

          Entry(
          'Questão 5',
          <Entry>[
            Entry(questao5)            
          ]
          ),

        ],        
        ),        
    ]
  )
  ];

  class EntryItem extends StatelessWidget {
    EntryItem(this.entry);

    final Entry entry;
  
    Widget _buildTiles(Entry root) {
      if (root.children.isEmpty) return ListTile(title: Text(root.title));
      
      return ExpansionTile(
        key: PageStorageKey<Entry>(root),
        title: Text(root.title),
        children: root.children.map(_buildTiles).toList(),
        );
    }

    @override 
    Widget build(BuildContext context){
      return _buildTiles(entry);
    }


    
  }




