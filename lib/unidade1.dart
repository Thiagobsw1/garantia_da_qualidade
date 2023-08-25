


import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart';

const String texto = '''
# Exercícios
1. Os testes, durante um projeto de desenvolvimento de software, são fundamentais para garantir a entrega de um produto de qualidade ao cliente, mas eles não podem iniciar sem que sejam planejados. Pode-se dizer que o maior propósito do planejamento de testes é:

  A. servir de guia para os testadores, mostrando a maneira como os testes devem ser realizados.
  
  O planejamento de testes tem vários objetivos, como, por exemplo, definir as partes do software que precisam ou não ser testadas, mas, o principal objetivo do planejamento de testes é servir de referência e guia ao longo da realização das atividades de teste.

''';


class Unidade1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {    

    
    return Scrollbar(
      child: Markdown(
        data: texto,        
      )
    );
  }
}



