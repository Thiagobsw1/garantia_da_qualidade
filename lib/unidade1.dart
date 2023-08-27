import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'dart:html';



const String questao1 = '''

1. Os testes, durante um projeto de desenvolvimento de software, são fundamentais para garantir a entrega de um produto de qualidade ao cliente, mas eles não podem iniciar sem que sejam planejados. Pode-se dizer que o maior propósito do planejamento de testes é:

    A. servir de guia para os testadores, mostrando a maneira como os testes devem ser realizados.
  
    O planejamento de testes tem vários objetivos, como, por exemplo, definir as partes do software que precisam ou não ser testadas, mas, o principal objetivo do planejamento de testes é servir de referência e guia ao longo da realização das atividades de teste.
    
    ''';

const String questao2 = '''

2. O documento que traz, de maneira detalhada, todos os problemas e erros encontrados, e ainda todos os acontecimentos ocorridos durante a realização dos testes, focando principalmente naqueles itens que precisarão ser avaliados posteriormente, segundo a norma IEEE 829, é:

    E. Relatório de incidentes de teste.

    O relatório de incidentes de teste apresenta, de maneira detalhada e minuciosa, todos os acontecimentos que ocorreram durante as atividades de teste, focando, principalmente, em itens que precisarão passar por avaliação de outros membros da equipe de projeto.
    
''';

const String questao3 = '''

3. Imagine que você é gestor de projeto de desenvolvimento de software, e está trabalhando em um grande projeto que contém vários testadores divididos em equipe. Qual é o documento que deve ser usado para definir o que será testado, e por quem, de acordo com a norma IEEE 829?

    C. Relatório de encaminhamento de itens de teste.

    Caso um grande projeto de desenvolvimento de software precise de mais de uma equipe de testadores, é possível utilizar um relatório de encaminhamento de itens de teste para indicar quais integrantes, de qual equipe, irão testar determinadas funcionalidades ou partes do software.
    
''';

const String questao4 = '''

  4. O PMBOK encara a realização dos testes, por ser uma tarefa extremamente importante para o desenvolvimento de um software, como um projeto independente. Sendo assim, qual é a área de conhecimento do projeto de testes que vai ficar encarregada de definir qual será a abrangência dos testes, bem como aquilo que deverá ser testado ou não?

      E. Gerenciamento do escopo.

      O gerenciamento do escopo, segundo o PMBOK, serve para definir a extensão do projeto de testes, definindo o que será ou não testado, incluindo os motivos para isso.
      
''';
const String questao5 = '''
  
  5. O PMBOK entende que os testes de software devem formar um projeto independente do projeto de desenvolvimento do software, tendo, inclusive, fases de ciclo de vida que, apesar de poderem ter a mesma nomenclatura, envolvem atividades diferentes. Nesse sentido, segundo o PMBOK, qual é a fase do projeto de testes que avalia se as atividades estão sendo realizadas conforme o planejado?

      D. Monitoramento e controle.

      A fase de monitoramento e controle é responsável por indicar se as atividades de teste estão acontecendo conforme o planejado, para que seja possível tomar alguma atitude saneadora antes mesmo que um problema atrapalhe o andamento do projeto de testes e também do projeto de software.    


'''
;



class Unidade1 extends StatelessWidget {
  const Unidade1({super.key});

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
    'Unidade 1',
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




