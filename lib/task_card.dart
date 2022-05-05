import 'all.dart';

class TaskCard extends StatefulWidget {
  final void Function() delete;
  final Task task;
  const TaskCard({Key? key, required this.task, required this.delete}) : super(key: key);

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(7, 5, 7, 0),
      child: RaisedButton(
        onPressed: () {
            TaskViewingData.ViewTask(widget.task);
            Navigator.pushNamed(context, '/task_details').then((value) => setState(() {}));
          },
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(5),
        ),
        color: widget.task.backgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Transform.scale(
              scale: 1.3,
              child: Checkbox(
                checkColor: Colors.white,
                activeColor: Colors.black87,
                value: widget.task.isDone,
                shape: CircleBorder(),
                onChanged: (bool? value) {
                setState(() {
                  widget.task.isDone = value!;
                  widget.task.backgroundColor = widget.task.isDone ? Colors.lightGreenAccent[700] :(widget.task.dateTime!.isBefore(DateTime.now()) ? Colors.red: Colors.white);
                });
                  },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.task.name, style: TextStyle(fontSize: 20 ),),
                  Text(widget.task.description, style: TextStyle(color: Colors.black54),),
                ],
              ),
            ),
            Spacer(),
            ElevatedButton(
              child: Icon(Icons.delete, color: Colors.black87, size: 25,),
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                shape: CircleBorder(),
                padding: EdgeInsets.all(10),
                elevation: 0,
              ),
              onPressed: widget.delete,
            ),
          ],
        ),
      ),
    );
  }
}
