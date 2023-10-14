
import 'package:app_movie/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
   
  const DetailsScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    //TODO:Cambiar luego por una instancia de movie

    //final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';

    return Scaffold(
    body: CustomScrollView(
      slivers: [
       const _CustomAppbar(),

        SliverList(
          delegate: SliverChildListDelegate([
           const  _PosterAndTitle(),
            const  _Overview(),
            const  _Overview(),
            const  _Overview(),
            const CastinCard(),
          ])
          

        )
      ],
    ),
    );
    
  }
}



class _CustomAppbar extends StatelessWidget { 
  const _CustomAppbar({Key? key}) : super(key: key);

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
          padding: EdgeInsets.only(bottom: 10),
          color: Colors.black12,
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          child:const  Text("Movie.title",
          style: TextStyle(fontSize: 16),
          ),
        ),
        background:const  FadeInImage(placeholder: AssetImage('assets/loading.gif'), image: NetworkImage("https://via.placeholder.com/500x300"), fit: BoxFit.cover,),
      ),
    );
  }
}
 



class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin:const  EdgeInsets.only(top: 20),
      padding:const  EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child:const  FadeInImage(placeholder: AssetImage('assets/no-image.jpg'), image: NetworkImage("https://via.placeholder.com/200x300"), height: 150,),
          ),

             const SizedBox(width: 20),

             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("movie.title", style: Theme.of(context).textTheme.headlineSmall, overflow: TextOverflow.ellipsis, maxLines: 2,),
                Text("movie.originalTitle", style: Theme.of(context).textTheme.titleMedium, overflow: TextOverflow.ellipsis,),

                Row(
                  children:[
                    const Icon(Icons.star_outline, size: 25, color: Colors.grey,),
                    const   SizedBox(width: 5,),
                    Text("Movie.Vote", style: Theme.of(context).textTheme.bodySmall,)
                  ],
                )
              ],
             )
        ],
      ),
    );
  }
}






class _Overview extends StatelessWidget {
   
  const _Overview({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text("Aute officia nisi do aute non laboris. Nostrud dolor velit exercitation consequat adipisicing culpa anim irure do ex et exercitation nulla. Tempor in quis irure aliquip enim. Enim voluptate eu est commodo aute aliquip minim proident adipisicing ad ipsum enim ullamco sit. Mollit pariatur ipsum consectetur dolor culpa Lorem mollit dolor aliquip exercitation eiusmod voluptate. Dolore et aliquip ullamco veniam veniam deserunt adipisicing ipsum reprehenderit dolore cillum non. Cupidatat ullamco culpa laborum aute aliqua minim.",
      textAlign: TextAlign.justify,
      style: Theme.of(context).textTheme.titleMedium,),
    );
  }
}