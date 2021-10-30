import 'package:cached_network_image/cached_network_image.dart';
import 'package:fittness_app/models/excercise_model.dart';
import 'package:fittness_app/pages/ejercicio_gif_page.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class EjercicioPage extends StatefulWidget {

  final Exercise ejercicio;

  const EjercicioPage({Key? key, required this.ejercicio}) : super(key: key);


  @override
  _EjercicioPageState createState() => _EjercicioPageState();
}

class _EjercicioPageState extends State<EjercicioPage> {

  int seconds =10;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Hero(
          tag: widget.ejercicio.id,
    
          child: Stack(
            // alignment: Alignment.center,
            children: [
              CachedNetworkImage(
                imageUrl: widget.ejercicio.thumbnail,
                placeholder: ( context, url ) => Image(
                  image: AssetImage( 'assets/no-image.jpg' ),
                  fit: BoxFit.cover,
                  height: size.height,
                  width: size.width,
                ) ,
                errorWidget: ( context, url, error ) => Icon( Icons.error ),
                fit: BoxFit.cover,
                height: size.height,
                width: size.width,
              ),
    
              Container(
                height: size.height,
                width: size.width,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color( 0xFF000000 ),
                      Color( 0x00000000),
                    ],
                  begin : Alignment.bottomCenter,
                  end : Alignment.center
                  ),
                ),
              ),
    
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  width: size.width * 0.5,
                  height: size.height * 0.4,
                  child: SleekCircularSlider(
                    appearance: CircularSliderAppearance(),
                    onChange: (double value) {
                      
                      seconds = value.toInt();

                    },
                    initialValue: 10,
                    min: 10,
                    max: 60,
                    innerWidget: (value){
                      return Container(
                        alignment: Alignment.center,
                        child: Text(
                          '${value.toInt()} s',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              GestureDetector(
                child: Center(
                  child: Container(
                    alignment: Alignment.center,
                    width: size.width * 0.4,
                    height: size.height * 0.05,
                    child: const Text( "Iniciar Ejercicio", style: TextStyle( color: Colors.white, fontSize: 20 ) ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color( 0xFFE83350 ) ,
                    ),
                  ),
                ),
                onTap: (){

                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: ( context ) => EjercicioGifPage(
                        ejercicio : widget.ejercicio, seconds: seconds,
                      )
                    )
                  );

                },
              )  ,

              SafeArea(
                child: GestureDetector(
                  child: Container(
                    margin: EdgeInsets.all(5),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration( 
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(100)
                     ),
                    child: Icon( Icons.arrow_back_sharp ),
                  ),
                  onTap: () => Navigator.pop(context),
                ),
              )

            ],
          ) 
    
    
        ),
      ),
    );
  }
}