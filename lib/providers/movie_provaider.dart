import 'package:app_movie/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class MovieProvaider extends ChangeNotifier{

  final String _apikey = '9e2f3fef48c3c418c135e5fce778acb5';
  final String _baseurl = "api.themoviedb.org";
  final String _language = 'es-ES';

  List<Movie> onDisplayMovies=[];

  MovieProvaider(){
    print("inicializado");

     getOnDisplay();
  }


  //meotodo 
  getOnDisplay() async{
    var url = Uri.https(_baseurl, '3/movie/now_playing', {
      'api_key': _apikey,
      'language' : _language,
      'page': '1'
    });

  // Await the http get response, then decode the json-formatted response.
  final response = await http.get(url);
  final nowPlayingResponse = NowplayinREsponse.fromJson(response.body);

  onDisplayMovies = nowPlayingResponse.results;
  notifyListeners();
}
}

