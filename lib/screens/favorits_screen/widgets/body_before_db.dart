
import 'package:flutter/material.dart';
import 'package:hotel_b/screens.dart';
class BodyBefore extends StatelessWidget {
  const BodyBefore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Container(
      child: Column(children: [
        
       Image(image: AssetImage('assets/favorites.png'),width: double.infinity,height: 400
         ,),
        Text("Tap on the icon to save your favorites ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
        SizedBox(height: 7,),

        TextButton(onPressed:() {Navigator.pushNamed(context, Screens.namedRout);}, child: Text('Search',))
        
      ],),
    ));
  }
}
