import 'package:flutter/material.dart';
import 'package:network_requests/list_apis.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
          itemCount: links.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              child: ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => links[index].screen));
                },
                title: Text(links[index].title),
                subtitle: Text(links[index].link),
              ),
            );
          }),
    );
  }
}
