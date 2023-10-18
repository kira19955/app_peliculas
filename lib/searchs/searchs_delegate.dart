import 'package:app_movie/models/models.dart';
import 'package:flutter/material.dart';
import 'package:app_movie/providers/movie_provaider.dart';
import 'package:provider/provider.dart';

class MovieSearchDelegate extends SearchDelegate {
  @override
  // TODO: implement searchFieldLabel
  String? get searchFieldLabel => "Buscar Pelicula";

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Text("buildResults");
  }




    Widget _emptyContainer() {
      return Container(
          child: Center(
            child: Icon( Icons.movie_creation_outlined, color: Colors.black38, size: 130, ),
          ),
        );
    }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    if (query.isEmpty) {
      return _emptyContainer();
    }

    final movieProvaider = Provider.of<MovieProvaider>(context, listen: false);

    return FutureBuilder(
      future: movieProvaider.searchMovie(query),
      builder: (_, AsyncSnapshot<List<Movie>> snapshot) {
        if (!snapshot.hasData)
          return _emptyContainer();

        final movies = snapshot.data!;

        return ListView.builder(
          itemBuilder: (context, index) => _MovieItem(movies[index]),
          itemCount: movies.length,
        );
      },
    );
  }
}

class _MovieItem extends StatelessWidget {

  final Movie movie;

  const _MovieItem( this.movie );

  @override
  Widget build(BuildContext context) {


    return ListTile(
      leading: FadeInImage(
        placeholder: AssetImage('assets/no-image.jpg'), 
        image: NetworkImage( movie.fullPosterImg ),
        width: 50,
        fit: BoxFit.contain,
      ),
      title: Text( movie.title ),
      subtitle: Text( movie.originalTitle ),
      onTap: () {
        
        Navigator.pushNamed(context, 'detail', arguments: movie );
      },
    );
  }
}