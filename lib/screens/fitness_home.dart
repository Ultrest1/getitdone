import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/workout_controller.dart';

class FitnessHomePage extends StatelessWidget {
  FitnessHomePage({Key? key}) : super(key: key);

  final WorkoutController controller = Get.put(WorkoutController());
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fitness Workouts'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            builder: (_) => Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                  left: 16,
                  right: 16,
                  top: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: textController,
                    decoration: const InputDecoration(
                      labelText: 'Workout Name',
                    ),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      if (textController.text.isNotEmpty) {
                        controller.addWorkout(textController.text);
                        textController.clear();
                        Get.back();
                      }
                    },
                    child: const Text('Add Workout'),
                  ),
                ],
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Obx(() => ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: controller.workouts.length,
            itemBuilder: (context, index) {
              final workout = controller.workouts[index];
              return Card(
                child: ListTile(
                  title: Text(workout.name),
                  leading: Checkbox(
                    value: workout.isCompleted,
                    onChanged: (_) => controller.toggleCompleted(index),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => controller.removeWorkout(index),
                  ),
                ),
              );
            },
          )),
    );
  }
}
