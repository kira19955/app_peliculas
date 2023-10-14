import 'package:flutter/material.dart';

class CastinCard extends StatelessWidget {
   
  const CastinCard({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),

      width: double.infinity,
      height: 180,
      child: ListView.builder(itemBuilder:(_, index) {
        return const _CastCard1();
      },itemCount: 10,
      scrollDirection: Axis.horizontal,),
    );
  }
}



class _CastCard1 extends StatelessWidget {
  const _CastCard1({Key? key}) : super(key: key);

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
            child: FadeInImage(placeholder: AssetImage('assets/no-image.jpg'), image: NetworkImage("https://via.placeholder.com/150x300"), height:140, width:100, fit: BoxFit.cover,)
          ),

          Text("Actor.movie", maxLines: 2, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center,),
        ],
      ),
    );
  }
}