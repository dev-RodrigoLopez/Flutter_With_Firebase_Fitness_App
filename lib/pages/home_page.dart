import 'package:fittness_app/models/excercise_model.dart';
import 'package:fittness_app/providers/exercicios_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  void initState() {
    super.initState();
    Provider.of<ExerciseProvider>(context, listen: false).getEjercicios();
  }

  @override
  Widget build(BuildContext context) {

    final ejercicios = Provider.of<ExerciseProvider>(context).lEjercicio;

    return Scaffold(
      
       appBar: AppBar(
        title: Text( 'Fitness App' ),
      ),

      body: Container(

        child: ejercicios != null 
          ? ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: ejercicios.length,
            itemBuilder: (context, index){
              return Container( 
                margin: EdgeInsets.only( top: 10, left: 10, right: 10 ) ,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),

                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: FadeInImage(
                    image: NetworkImage( ejercicios[index].thumbnail ),
                    placeholder: AssetImage( 'assets/no-image.jpg' ),
                    width: MediaQuery.of( context ).size.width,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),

               );
            })
          : LinearProgressIndicator()

      ),

    );
  }
}