import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _selected;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Navigator(
        onPopPage: (route, result) {
          if (!route.didPop(result)) return false;
          setState(() {
            _selected = null;
          });
          return true;
        },
        pages: [
          MaterialPage(
            child: ListPage(
              onTap: (selected) {
                setState(() {
                  _selected = selected;
                });
              },
            ),
          ),
          if (_selected != null)
            MaterialPage(
              child: DetailsPage(
                selected: _selected,
              ),
            ),
        ],
      ),
    );
  }
}

class ListPage extends StatelessWidget {
  const ListPage({
    Key key,
    @required this.onTap,
  }) : super(key: key);

  final Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          final item = "Elemento $index";
          return ListTile(
            title: Text(item),
            onTap: () => onTap(item),
          );
        },
        itemCount: 10,
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    Key key,
    @required this.selected,
  }) : super(key: key);

  final String selected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(selected),
      ),
      body: Container(
        child: Text("Pag 2"),
      ),
    );
  }
}
