import 'package:app_movie/models/movie.dart';
import 'package:flutter/material.dart';

class MovieSlaider extends StatelessWidget {

  final List<Movie>  movies;
  final String? title;

  const MovieSlaider({Key? key, required this.movies, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 260,
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          if(title != null)
             Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  title!,
                  style:const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),

          const SizedBox(height: 5),


          Expanded(
            child: ListView.builder(scrollDirection: Axis.horizontal ,itemCount: movies.length, itemBuilder:(context, index) =>  _MoviePoster( movies[index] ),),
          )
        ],
      ),
    );
  }
}



class _MoviePoster extends StatelessWidget {
   
  final Movie movies; 

  const _MoviePoster(this.movies);
  
  @override
  Widget build(BuildContext context) {
    return Container(
                width: 130, 
                height: 190,
                margin:const  EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [

                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, 'detail', arguments: 'movie-instance'),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: FadeInImage(placeholder:const  AssetImage('assets/no-image.jpg'),
                         image: NetworkImage(movies.fullPosterImg),
                         width: 130,
                         height: 190,
                         fit: BoxFit.cover),
                      ),
                    ),

                    const  SizedBox(height: 5),

                      Text(movies.title,
                     overflow: TextOverflow.ellipsis,
                     textAlign: TextAlign.center,)



                  ],
                ),
              );
  }
}