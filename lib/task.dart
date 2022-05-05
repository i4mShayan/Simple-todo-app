import 'all.dart';

class Task{
  static List<Task> tasks=[];
  late String name, description;
  late Color? backgroundColor;
  DateTime? dateTime;
  bool isDone;
  Task({required this.name, required this.description, required this.dateTime,this.isDone=false, this.backgroundColor=Colors.white}){
    this.backgroundColor = dateTime!.isBefore(DateTime.now()) ? Colors.red: Colors.white;
  }

  void deleteTask(){
      tasks.remove(this);
  }
}