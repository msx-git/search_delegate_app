import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'search_delegate/dummy_data.dart';
import 'search_delegate/search_view_delegate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<String> filteredData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
        actions: [
          IconButton(
            onPressed: () async {
              String? result = await showSearch(
                context: context,
                delegate: SearchViewDelegate(data: dummyData),
              );
              if (kDebugMode) {
                print(result);
              }
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: filteredData.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(filteredData[index]),
          );
        },
      ),
    );
  }
}
