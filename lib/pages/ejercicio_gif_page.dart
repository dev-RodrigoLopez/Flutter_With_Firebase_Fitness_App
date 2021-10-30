import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fittness_app/models/excercise_model.dart';
import 'package:flutter/material.dart';

class EjercicioGifPage extends StatefulWidget {

  final Exercise ejercicio;
  final int seconds;

  const EjercicioGifPage({Key? key, required this.ejercicio, required this.seconds}) : super(key: key);

  @override
  _EjercicioGifPageState createState() => _EjercicioGifPageState();
}

class _EjercicioGifPageState extends State<EjercicioGifPage> {

  bool _isCompleted = false;
  int _elapsedSecons = 0;

  late Timer timer;


  @override
  void initState() {

    timer = Timer.periodic(
      Duration( seconds: 1 ),
      (timer) { 

        if( timer.tick == widget.seconds ){
          timer.cancel();
          setState(() {
            _isCompleted = true;
          });
        }

        setState(() {
          _elapsedSecons = timer.tick;
        });

      }
    );


    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

  final size = MediaQuery.of(context).size;
  
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: CachedNetworkImage(
              imageUrl: widget.ejercicio.gif,
              placeholder: ( context, url ) => Image(
                image: AssetImage( 'assets/loading.gif' ),
                fit: BoxFit.contain,
                height: size.height,
                width: size.width,
              ) ,
              errorWidget: ( context, url, error ) => Icon( Icons.error ),
              fit: BoxFit.contain,
              height: size.height,
              width: size.width,
            ),
          ),

          _isCompleted != true 
            ? SafeArea(
              child: Container(
                margin: EdgeInsets.all(20),
                alignment: Alignment.topCenter,
                child: Text( "$_elapsedSecons / ${ widget.seconds } s" , style: TextStyle( fontSize: 20 ), ),
              ),
            )
            : Container(),

            SafeArea(
              child: IconButton(
                icon: Icon(  Icons.close ),
                onPressed: (){
                  Navigator.pop(context);
                },
              ) 
            )

        ],
      ),
    );
  }
}