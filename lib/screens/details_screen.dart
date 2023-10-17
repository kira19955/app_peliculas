
import 'package:app_movie/models/models.dart';
import 'package:app_movie/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
   
  const DetailsScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    //TODO:Cambiar luego por una instancia de movie

    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;
    print(movie.title);

    return Scaffold(
    body: CustomScrollView(
      slivers: [
        _CustomAppbar(movie: movie),

        SliverList(
          delegate: SliverChildListDelegate([
             _PosterAndTitle(movie: movie),
              _Overview(movie: movie,),
             
             CastinCard(Movie_Id: movie.id),
          ])
          

        )
      ],
    ),
    );
    
  }
}



class _CustomAppbar extends StatelessWidget { 

  final Movie movie;
  const _CustomAppbar({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned:  true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding:const  EdgeInsets.all(0),
        title: Container(
          padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
          color: Colors.black12,
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          child:Text(movie.title,
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
          ),
        ),
        background: FadeInImage(placeholder: AssetImage('assets/loading.gif'), image: NetworkImage(movie.fullBackdropPath), fit: BoxFit.cover,),
      ),
    );
  }
}
 



class _PosterAndTitle extends StatelessWidget {

  final Movie movie;
  const _PosterAndTitle({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return  Container(
      margin:const  EdgeInsets.only(top: 20),
      padding:const  EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(placeholder: AssetImage('assets/no-image.jpg'), image: NetworkImage(movie.fullPosterImg), height: 110,),
          ),

             const SizedBox(width: 20),

             ConstrainedBox(
              constraints: BoxConstraints(maxWidth: size.width - 190),
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(movie.title, style: Theme.of(context).textTheme.headlineSmall, overflow: TextOverflow.ellipsis, maxLines: 2,),
                  Text(movie.originalTitle, style: Theme.of(context).textTheme.titleMedium, overflow: TextOverflow.ellipsis,maxLines: 2,),
             
                  Row(
                    children:[
                      const Icon(Icons.star_outline, size: 25, color: Colors.grey,),
                      const   SizedBox(width: 5,),
                      Text("${movie.voteAverage}", style: Theme.of(context).textTheme.bodySmall,)
                    ],
                  )
                ],
               ),
             )
        ],
      ),
    );
  }
}






class _Overview extends StatelessWidget {

  final Movie movie;
   
  const _Overview({Key? key, required this.movie}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(movie.overview,
      textAlign: TextAlign.justify,
      style: Theme.of(context).textTheme.titleMedium,),
    );
  }
}