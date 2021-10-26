import 'dart:convert';
import 'package:fittness_app/models/excercise_model.dart';
import 'package:fittness_app/models/exercises_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class ExerciseProvider extends ChangeNotifier{

  List<Exercise> lEjercicio = [];

  getEjercicios() async{

    try{
       final resp = await http.get( Uri.parse( "https://raw.githubusercontent.com/codeifitech/fitness-app/master/exercises.json" ) );
        final body =  jsonDecode( resp.body );
        final ejercicios =  ExercisesModel.fromJson( body ); 
        lEjercicio = ejercicios.exercises;
        notifyListeners();
    }
    catch(e){
      throw 'Error al obtener los ejercicios';
    }

   
   
  }


}