import 'package:app_movie/models/models.dart';
import 'package:flutter/material.dart';

class MovieSlaider extends StatefulWidget {

  final List<Movie>  movies;
  final String? title;
  final Function onNextPage;

  const MovieSlaider({Key? key, required this.movies, this.title, required this.onNextPage}) : super(key: key);

  @override
  State<MovieSlaider> createState() => _MovieSlaiderState();
}

class _MovieSlaiderState extends State<MovieSlaider> {

  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    scrollController.addListener(() { 

      if (scrollController.position.pixels >= scrollController.position.maxScrollExtent - 500) {

          widget.onNextPage();
        
      }

    });

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }





  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 260,
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          if(widget.title != null)
             Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  widget.title!, 
                  style:const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),

          const SizedBox(height: 5),


          Expanded(
            child: ListView.builder(controller: scrollController,scrollDirection: Axis.horizontal ,itemCount: widget.movies.length, itemBuilder:(context, index) =>  _MoviePoster( widget.movies[index] ),),
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
                      onTap: () => Navigator.pushNamed(context, 'detail', arguments: movies),
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

