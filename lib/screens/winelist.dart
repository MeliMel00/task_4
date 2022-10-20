import 'package:network_requests/models.dart/details_model.dart';
import 'package:network_requests/screens/winepage.dart';

final List<DetailsModel> links = [
  DetailsModel(
      title: "Reds",
      link: "https://api.sampleapis.com/wines/reds",
      screen: const WineScreen(
          title: "Avatar", apiLink: "https://api.sampleapis.com/wines/reds")),
  DetailsModel(
      title: "Whites",
      link: "https://api.sampleapis.com/wines/whites",
      screen: const WineScreen(
          title: "Avatar", apiLink: "https://api.sampleapis.com/wines/whites")),
  DetailsModel(
      title: "Sparkling",
      link: "https://api.sampleapis.com/wines/sparkling",
      screen: const WineScreen(
          title: "Avatar",
          apiLink: "https://api.sampleapis.com/wines/sparkling")),
  DetailsModel(
      title: "Rose",
      link: "https://api.sampleapis.com/wines/rose",
      screen: const WineScreen(
          title: "Avatar", apiLink: "https://api.sampleapis.com/wines/rose")),
  DetailsModel(
      title: "Dessert",
      link: "https://api.sampleapis.com/wines/dessert",
      screen: const WineScreen(
          title: "Avatar",
          apiLink: "https://api.sampleapis.com/wines/dessert")),
  DetailsModel(
      title: "Port",
      link: "https://api.sampleapis.com/wines/port",
      screen: const WineScreen(
          title: "Avatar", apiLink: "https://api.sampleapis.com/wines/port")),
  // DetailsModel(
  //     title: "Baseball",
  //     link: "https://api.sampleapis.com/jokes/goodJokes",
  //     screen: const BaseballScreen(
  //       title: "Baseball",
  //       apiLink: "https://api.sampleapis.com/jokes/goodJokes",
  //     ))
];
