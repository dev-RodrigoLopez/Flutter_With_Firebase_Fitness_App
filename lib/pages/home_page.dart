import 'package:fittness_app/models/excercise_model.dart';
import 'package:fittness_app/pages/ejercicio_page.dart';
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
    final size = MediaQuery.of( context ).size;

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
              
              return GestureDetector(
                child: Hero(
                  tag: ejercicios[index].id,
                  child: _ItemList(ejercicio: ejercicios[index])
                ),
                onTap: (){
                  print('Puto');
                  Navigator.push( 
                    context, 
                    MaterialPageRoute(
                      builder: ( context ) => EjercicioPage(
                        ejercicio : ejercicios[index]
                      )
                    )
                  );

                },
              );

            })
          : LinearProgressIndicator()

      ),

    );
  }
}


class _ItemList extends StatelessWidget {

  final Exercise ejercicio;

  const _ItemList({Key? key, required this.ejercicio}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of( context ).size;

    return Container( 
        margin: EdgeInsets.only( top: 10, left: 10, right: 10 ) ,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),

        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                image: NetworkImage( ejercicio.thumbnail ),
                placeholder: AssetImage( 'assets/no-image.jpg' ),
                width: size.width,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),

            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width:size.width,
                height: 250,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color( 0xFF000000 ),
                      Color( 0x00000000 )
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.center
                  )
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.all(15),
              height: 250,
              alignment: Alignment.bottomLeft,
              child: Text(
                ejercicio.title,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            )

          ],
        ),

        );
    }
}