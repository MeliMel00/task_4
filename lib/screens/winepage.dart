import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:network_requests/models.dart/wine_model.dart';

class WineScreen extends StatefulWidget {
  const WineScreen({super.key, this.title = '', this.apiLink = ''});
  final String title;
  final String apiLink;
  @override
  State<WineScreen> createState() => _WineScreenState();
}

class _WineScreenState extends State<WineScreen> {
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _callApi(widget.apiLink);
  }

  List<WineModel>? WineHistoryList = [];
  // List<Rating>? RatingList = [];
  _callApi(apiLink) async {
    try {
      setState(() {
        _isLoading = true;
      });
      var url = Uri.parse(widget.apiLink);
      http.Response response = await http.get(url);

      Iterable I = json.decode(response.body);

      WineHistoryList =
          List<WineModel>.from(I.map((model) => WineModel.fromJson(model)));
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
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 1.7;
    final double itemWidth = size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GridView.count(
              // Create a grid with 2 columns. If you change the scrollDirection to
              // horizontal, this produces 2 rows.
              crossAxisCount: 1,
              childAspectRatio: (itemWidth / itemHeight),
              // Generate 100 widgets that display their index in the List.
              children: List.generate(WineHistoryList!.length, (index) {
                return Center(
                    child: Container(
                  width: itemWidth - 25,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        constraints: BoxConstraints(
                          minHeight: 80,
                        ),
                        child: Column(children: [
                          Text(
                            '${WineHistoryList![index].wine}',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 24),
                          ),
                          Text(
                            '${WineHistoryList![index].winery}',
                            style: TextStyle(fontSize: 16),
                          ),
                        ]),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Image.network(
                          '${WineHistoryList![index].image}',
                          // fit: BoxFit.contain,

                          width: 200,
                          height: 200,
                        ),
                      ),
                      Text('${WineHistoryList![index].rating!.average}',
                          style: TextStyle(fontSize: 20)),
                      Text('${WineHistoryList![index].rating!.reviews}',
                          style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ));
              }),
            ),
    );
  }
}
