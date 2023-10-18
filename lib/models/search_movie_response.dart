import 'dart:convert';

import 'package:app_movie/models/models.dart';

class SearchMovieResponso {
    int page;
    List<Movie> results;
    int totalPages;
    int totalResults;

    SearchMovieResponso({
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    factory SearchMovieResponso.fromJson(String str) => SearchMovieResponso.fromMap(json.decode(str));

    

    factory SearchMovieResponso.fromMap(Map<String, dynamic> json) => SearchMovieResponso(
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

   
}

