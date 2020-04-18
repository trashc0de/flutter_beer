import 'dart:convert';

import 'package:flutterapp/domain/beer.dart';
import 'package:flutterapp/ui/common/network.dart';

class Repository {

  static Future<List<Beer>> getBeers() async {

    final beers = await Network.getBeerData();

    final List beerJsonList = jsonDecode(beers);
    final List<Beer> result = List();

    beerJsonList.forEach((jsonObject) {
      final beer = _withJson(jsonObject);
      result.add(beer);
    });

    return result;

  }

  static Beer _withJson(Map<String, dynamic> jsonObject) {
    return Beer(
      id: jsonObject["id"],
      name: jsonObject["name"],
      description: jsonObject["description"],
      imageUrl: jsonObject["image_url"],
    );
  }

}
