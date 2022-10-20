import 'package:network_requests/models.dart/details_model.dart';
import 'package:network_requests/screens/listpage.dart';
import 'package:network_requests/screens/jokepage.dart';

final List<DetailsModel> links = [
  DetailsModel(
      title: "Wines",
      link: "https://api.sampleapis.com/wines/reds",
      screen: const ListWinePage(
          title: "Avatar", apiLink: "https://api.sampleapis.com/wines/reds")),
  DetailsModel(
      title: "Good Jokes",
      link: "https://api.sampleapis.com/jokes/goodJokes",
      screen: const JokeScreen(
        title: "Baseball",
        apiLink: "https://api.sampleapis.com/jokes/goodJokes",
      ))
];
