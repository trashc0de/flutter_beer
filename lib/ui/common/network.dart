import 'package:http/http.dart' as http;

class Network {
  static final url = "https://api.punkapi.com/v2/beers?page=1&per_page=30";

  static Future<String> getBeerData() {
    return http.get(url).then((value) => value.body);
  }
}
