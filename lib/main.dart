import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/presenter/page_provider.dart';

void main() {
  runApp(Provider(
    create: (_) => PageProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
            child: Text('Hello World'),
          ),
        ),
      ),
    );
  }
}
