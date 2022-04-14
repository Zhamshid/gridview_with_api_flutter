import 'package:flutter/material.dart';
import 'package:gridview_test_with_api/network/networking_request.dart';

import 'model/names.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  gridView(AsyncSnapshot<List<Data>> snapshot) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 1,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      children: snapshot.data!.map<Widget>(
        (names) {
          return GestureDetector(
            child: const GridTile(
              child: Text('good job'),
            ),
            onTap: () {
              gotoDetailpage(context, names);
            },
          );
        },
      ).toList(),
    );
  }

  gotoDetailpage(BuildContext context, Data names) {}

  circularProgress() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Test gridview'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(
            child: FutureBuilder<List<Data>>(
              future: NetworkRequest.fetchNames(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      'Error ${snapshot.error}',
                      textAlign: TextAlign.center,
                    ),
                  );
                } else if (snapshot.hasData) {
                  return gridView(snapshot);
                }
                return circularProgress();
              },
            ),
          ),
        ],
      ),
    );
  }
}
