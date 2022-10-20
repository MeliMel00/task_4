import 'package:flutter/material.dart';
import 'package:network_requests/screens/winelist.dart';

class ListWinePage extends StatefulWidget {
  const ListWinePage({super.key, required this.title, required this.apiLink});

  final String title;
  final String apiLink;
  @override
  State<ListWinePage> createState() => _ListeWineScreenState();
}

class _ListeWineScreenState extends State<ListWinePage> {
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
