import 'package:flutter/material.dart';
import 'package:navigator_2_0/routes/custom_router_delegate.dart';
import 'package:navigator_2_0/routes/custom_router_parser.dart';

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
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerDelegate: CustomRouterDelegate(),
      routeInformationParser: CustomRouterParser(),
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
    );
  }
}
