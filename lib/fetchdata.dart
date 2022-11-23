import 'package:http/http.dart' as http;
import 'model/watch_list.dart';
import 'dart:convert';

Future<List<Watchlist>> fetchWatchlist() async {
  var url = Uri.parse('https://tugas-pbp22.herokuapp.com/mywatchlist/json/');
  var response = await http.get(
    url,
    headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
    },
  );

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object Watchlist
  List<Watchlist> listWatch = [];
  for (var d in data) {
    if (d != null) {
        listWatch.add(Watchlist.fromJson(d));
    }
  }

  return listWatch;
}