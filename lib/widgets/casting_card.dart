import 'package:app_movie/models/models.dart';
import 'package:app_movie/providers/movie_provaider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CastinCard extends StatelessWidget {
   
   final int  Movie_Id;
  
  const CastinCard({Key? key, required this.Movie_Id}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MovieProvaider>(context, listen: false);

    return FutureBuilder(
      future: moviesProvider.getMovieCast(Movie_Id),
      builder: (_, AsyncSnapshot <List<Cast>> snapshot) {

        if (!snapshot.hasData) {
          return Container(
            constraints:  BoxConstraints(maxWidth: 150),
            height: 180,
            child: CupertinoActivityIndicator(),
          );
        }

        final cast = snapshot.data!;
        
         return Container(
      margin: EdgeInsets.only(bottom: 30),

      width: double.infinity,
      height: 180,
      child: ListView.builder(itemBuilder:(_, index) {
        return  _CastCard1(actor: cast[index]);
      },itemCount: cast.length,
      scrollDirection: Axis.horizontal,),
    );




      },
    );


   
  }
}



class _CastCard1 extends StatelessWidget {

  final Cast actor;

  const _CastCard1({Key? key, required this.actor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      height: 100,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(placeholder: AssetImage('assets/no-image.jpg'), image: NetworkImage(actor.fullprofilePath), height:140, width:100, fit: BoxFit.cover,)
          ),

          Text(actor.name, maxLines: 2, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center,),
        ],
      ),
    );
  }
}