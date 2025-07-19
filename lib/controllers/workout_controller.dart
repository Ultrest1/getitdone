import 'package:get/get.dart';
import '../models/workout.dart';

class WorkoutController extends GetxController {
  final workouts = <Workout>[].obs;

  void addWorkout(String name) {
    workouts.add(Workout(name: name));
  }

  void toggleCompleted(int index) {
    final workout = workouts[index];
    workout.isCompleted = !workout.isCompleted;
    workouts[index] = workout;
  }

  void removeWorkout(int index) {
    workouts.removeAt(index);
  }
}
