
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart';

const String texto = '''
# Unidade 2


''';


class Unidade2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {    

    
    return Scrollbar(
      child: Markdown(
        data: texto,        
      )
    );
  }
}