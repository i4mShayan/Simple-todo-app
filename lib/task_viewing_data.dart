import 'all.dart';

class TaskViewingData{
  static Task? viewing;
  static ViewTask(Task task){
    viewing=task;
    return viewing;
  }
}