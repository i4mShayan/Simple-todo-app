import '../all.dart';

class TaskDetails extends StatefulWidget {
  @override
  State<TaskDetails> createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Details'),
        centerTitle: true,
        backgroundColor: Colors.green[800],
      ),
      body: Column(
        children: [
          SizedBox(height: 10,),
          Container(
            padding: EdgeInsets.all(10),
            child: InputDecorator(
              decoration: InputDecoration(
                labelText: 'Name:',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: Text(
                  TaskViewingData.viewing!.name,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: InputDecorator(
              decoration: InputDecoration(
                labelText: 'Description:',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: Text(
                TaskViewingData.viewing!.description,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: InputDecorator(
              decoration: InputDecoration(
                labelText: 'Date:',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: Text(
                TaskViewingData.viewing!.dateTime.toString(),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Done"),
          Switch(
            value: TaskViewingData.viewing!.isDone,
            onChanged: (bool value) {
            setState(() {
            TaskViewingData.viewing!.isDone=value;
            TaskViewingData.viewing!.backgroundColor = TaskViewingData.viewing!.isDone ? Colors.lightGreenAccent[700] :(TaskViewingData.viewing!.dateTime!.isBefore(DateTime.now()) ? Colors.red: Colors.white);
            });
            }
            ),
          ],
          ),
        ],
      ),
    );
  }
}
