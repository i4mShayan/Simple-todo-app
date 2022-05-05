import '../all.dart';

class AddNewTask extends StatefulWidget {
  @override
  State<AddNewTask> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  TextEditingController _taskName=TextEditingController();

  TextEditingController _desc=TextEditingController();
  DateTime? _dateTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a new task!'),
        centerTitle: true,
        backgroundColor: Colors.green[800],
      ),
      body: Column(
        children: [
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: _taskName,
              decoration: InputDecoration(
                hintText: "Enter the task name",
                labelText: 'Task name:',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: _desc,
              decoration: InputDecoration(
                hintText: "Enter the description",
                labelText: 'Description:',
                border: OutlineInputBorder(),
              ),
              minLines: 5,
              maxLines: 10,
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
                    _dateTime==null ? "No date has been picked yet!" : _dateTime.toString()
                ),
            ),
          ),
          ElevatedButton.icon(
            onPressed: (){
              showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2003),
                  lastDate: DateTime(2400),
              ).then((date) => setState((
                  (){_dateTime=date;}
              )));
            },
            icon: Icon(Icons.calendar_month),
            label: Text("Pick a Date"),
            style: ElevatedButton.styleFrom(
              primary: Colors.green[800],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              padding: EdgeInsets.all(10),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if(_taskName.text.isEmpty || _dateTime==null){
            showDialogWith(title: 'Wait!', content: 'Where you going this fast!?\nEnter a name and pick up a date!', context: context);
          }
          else {
            setState(() {
              Task.tasks.add(Task(name: _taskName.text, description: _desc.text, dateTime: _dateTime));
              }
            );
            Navigator.of(context).pop();
          }
        },
        child: Icon(Icons.check, size: 30,),
        backgroundColor: Colors.green[800],
      ),
    );
  }
}
