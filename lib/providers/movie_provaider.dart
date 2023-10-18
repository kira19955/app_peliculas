import 'package:app_movie/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MovieProvaider extends ChangeNotifier {
  final String _apikey = '9e2f3fef48c3c418c135e5fce778acb5';
  final String _baseurl = "api.themoviedb.org";
  final String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  Map<int, List<Cast>> movieCast = {};

  int _popularPage = 0;

  MovieProvaider() {
    print("inicializado");

    getOnDisplay();
    getPopularMovies();
  }

  Future<String> _getJsonData(String endpoint, [int page = 1] ) async {


    final url = Uri.https(_baseurl, endpoint,
        {'api_key': _apikey, 'language': _language, 'page': "$page" });

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    return response.body;


  }

  //meotodo
  getOnDisplay() async {
    
    final jsonData = await _getJsonData('3/movie/now_playing');
    final nowPlayingResponse = NowplayinREsponse.fromJson(jsonData);

    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners();
  }

  
  getPopularMovies() async {
    _popularPage ++;

    final jsonData = await _getJsonData('3/movie/popular', _popularPage);
    final popularResponse = PopularResponse.fromJson(jsonData);

    popularMovies = [...popularMovies, ...popularResponse.results];
    print("********************************************");
    print(popularMovies[0]);
    notifyListeners();
  }

  Future<List<Cast>> getMovieCast(int movie_id) async{

    if(movieCast.containsKey(movie_id)) return movieCast[movie_id]!;

    print("Pidiendo info de los actores");

    final jsonData = await _getJsonData('3/movie/$movie_id/credits');
    final credictResponse = CredictResponse.fromJson(jsonData);
    
    movieCast[movie_id] = credictResponse.cast;

    return credictResponse.cast;
  }


  Future<List<Movie>> searchMovie(String query) async {

    final url = Uri.https(_baseurl, "3/search/movie",
        {'api_key': _apikey, 'language': _language, 'query': query });

        final response = await http.get(url);
        final searchResponse = SearchMovieResponso.fromJson(response.body);
        print(searchResponse.results);

        return searchResponse.results;




  }


}
