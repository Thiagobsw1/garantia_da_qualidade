import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:garantia_da_qualidade/unidade1.dart';
import 'package:garantia_da_qualidade/unidade2.dart';
import 'package:provider/provider.dart';
import 'package:flutter_markdown/flutter_markdown.dart';




void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Garantia de Qualidade',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {  
  
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var selectedIndex = 0;  

  @override
  Widget build(BuildContext context) {

    Widget page;
  switch (selectedIndex) {
    case 0:
      page = Unidade1() as Widget;
      break;
    case 1:
      page = Unidade2() as Widget;

      break;
    default:
      throw UnimplementedError('no widget for $selectedIndex');
  }

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: Row(

            children: [
              SafeArea(                            
                child: NavigationRail(
                  extended: constraints.maxWidth >= 800,
                  destinations: [
                    NavigationRailDestination(
                      icon: Icon(Icons.ads_click),
                      label: Text('Unidade 1'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.ads_click),
                      label: Text('Unidade 2'),
                    ),
                  ],
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (value) {
                    setState(() {
                      selectedIndex = value;
                    });                    
                  },
                ),
              ),
              Expanded(
                child: Container(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: page,                  
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}

