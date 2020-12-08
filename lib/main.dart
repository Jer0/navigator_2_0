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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListPage(),
    );
  }
}

class ListPage extends StatelessWidget {
  const ListPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          final item = "Elemento $index";
          return ListTile(
            title: Text(item),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailsPage(selected: item),
            )),
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
