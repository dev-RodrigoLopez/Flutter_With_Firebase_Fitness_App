import 'package:fittness_app/models/excercise_model.dart';

class ExercisesModel {
  ExercisesModel({
    required this.exercises,
  });
  late final List<Exercise> exercises;
  
  ExercisesModel.fromJson(Map<String, dynamic> json){
    exercises = List.from(json['exercises']).map((e)=>Exercise.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['exercises'] = exercises.map((e)=>e.toJson()).toList();
    return _data;
  }
}

