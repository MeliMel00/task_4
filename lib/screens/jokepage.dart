import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:network_requests/models.dart/joke_model.dart';

class JokeScreen extends StatefulWidget {
  const JokeScreen({super.key, this.title = '', this.apiLink = ''});
  final String title;
  final String apiLink;
  @override
  State<JokeScreen> createState() => _JokeScreenState();
}

class _JokeScreenState extends State<JokeScreen> {
  bool _isLoading = false;
  bool pressed = false;
  int id_button = 0;

  @override
  void initState() {
    super.initState();
    _callApi(widget.apiLink);
  }

  List<JokeModel>? JokeHistoryList = [];
  _callApi(apiLink) async {
    try {
      setState(() {
        _isLoading = true;
      });
      var url = Uri.parse(widget.apiLink);
      http.Response response = await http.get(url);

      Iterable I = json.decode(response.body);

      JokeHistoryList =
          List<JokeModel>.from(I.map((model) => JokeModel.fromJson(model)));
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: JokeHistoryList!.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade600,
                        spreadRadius: 0.1,
                        blurRadius: 5,
                        offset: const Offset(0, 1),
                      ).scale(4),
                    ]),
                    child: Column(children: [
                      // Text('${JokeHistoryList![index].id}'),
                      Text(
                        '${JokeHistoryList![index].type}'.toUpperCase(),
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(id_button.toString()),
                      ElevatedButton(
                        style:
                            TextButton.styleFrom(backgroundColor: Colors.white),
                        onPressed: () {
                          setState(() {
                            id_button = JokeHistoryList![index].id!;
                            pressed = !pressed;
                          });
                        },
                        child: Text(
                          '${JokeHistoryList![index].setup}',
                          style: TextStyle(color: Colors.lightBlue),
                          key: Key('${JokeHistoryList![index].id}'),
                        ),
                      ),
                      Container(
                          padding: const EdgeInsets.all(10),
                          constraints: BoxConstraints(
                            minHeight: 40,
                          ),
                          child: Visibility(
                            // I try to use the id button to show the punchline in the right container,not in all of them
                            key: Key('${JokeHistoryList![index].id}'),
                            visible: pressed,
                            child: Text(
                              '${JokeHistoryList![id_button].punchline}',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                          // child: pressed
                          // ? Text(
                          //     '${JokeHistoryList![index].punchline}',
                          //     style: TextStyle(
                          //       color: Colors.blue,
                          //       fontSize: 16,
                          //       fontWeight: FontWeight.bold,
                          //     ),
                          //   )
                          // : SizedBox(),
                          )
                    ]),
                  );
                }));
  }
}
