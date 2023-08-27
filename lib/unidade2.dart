import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'dart:html';



const String questao1 = '''
1. O diagrama de caso de uso é um dos artefatos mais importantes da UML, que descreve as funcionalidades do software de acordo com a visão dos seus usuários. Nesse sentido, pode-se afirmar que o diagrama de caso de uso define:

    A. a forma de interação dos usuários com o software, por meio de suas funcionalidades.

    O diagrama de caso de uso define como os usuários interagem com as funcionalidades do software, sem se preocupar com nenhum aspecto ou detalhamento técnico do sistema, nem com sua estrutura interna, ou com aspectos do projeto como um todo.

''';

const String questao2 = '''
2. O diagrama de caso de uso é um documento que representa, de maneira visual, como se dá a interação do usuário com as funcionalidades do sistema. Geralmente, o diagrama de caso de uso possui quatro papéis, que representam os elementos envolvidos na funcionalidade. São eles:

    B. cenário, atores, caso de uso, comunicação

    Os nomes dos elementos de um caso de uso são: cenário, que é a sequência de ações realizadas; atores, que são os usuários ou perfis de usuário no sistema; caso de uso, que é a funcionalidade ou atividade realizada pelo ator; e comunicação, que estabelece a conexão entre o usuário e o caso de uso.
    
''';

const String questao3 = '''
3. Um caso de teste é um documento que pretende especificar detalhadamente como serão os testes de uma determinada parte específica do software. Por meio da realização de um caso de teste, o testador consegue identificar se os elementos foram construídos de forma condizente com o pedido inicial. Assinale a alternativa que apresenta esses elementos:

    C. Funcionalidades e requisitos do software

    Por meio da execução dos testes baseados no caso de teste, será possível que o testador identifique se os requisitos do software foram implementados conforme o usuário havia pedido no início do projeto. As demais alternativas se referem a aspectos internos e de projeto

''';

const String questao4 = '''
4. O projeto de desenvolvimento de um software passa por várias etapas, que podem receber nomenclaturas diferentes nas empresas, mas, geralmente, giram em torno de início, planejamento, preparação, especificação, execução e entrega. Os testes, antes de serem realizados, precisam ser planejados a fundo. Em que etapa isso acontece?

    E. Especificação

    Os testes precisam ser planejados em detalhes, antes que sejam realizados. Normalmente, esse planejamento acontece na etapa de especificação do projeto de software. Nas demais fases, os testes são realizados.
      
''';
const String questao5 = '''
5. O caso de teste é o documento que, uma vez que sejam realizados os testes baseados nele, irá comprovar ou não que as funcionalidades e os requisitos do software foram elaborados conforme o que havia sido solicitado no início do projeto. Finalizados os testes, um caso de teste pode gerar dois tipos de resultados. Quais são eles?

    D. Positivo ou negativo

    Um caso de teste pode ser positivo, quando demonstra que o requisito e a funcionalidade foram desenvolvidos conforme o esperado, e negativo, quando identifica que o requisito e a funcionalidade são atendidos somente em parte pelo software que foi desenvolvido.      

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




