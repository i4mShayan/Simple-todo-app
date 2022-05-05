import '../all.dart';

class Home extends StatefulWidget{
  static List<Widget> listWidgets=[];

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    List<Widget> getListWidgets() {
      Home.listWidgets=[];
      setState(() {
        for (int i = 0; i < Task.tasks.length - 1; i++){
          for (int j = 0; j < Task.tasks.length - i - 1; j++){
            if (Task.tasks[j].dateTime!.isBefore(Task.tasks[j+1].dateTime!)) {
                Task temp=Task.tasks[j];
                Task.tasks[j]=Task.tasks[j+1];
                Task.tasks[j+1]=temp;
            }
          }
        }
        Home.listWidgets.addAll(Task.tasks.map((task) =>
            TaskCard(task: task, delete: () {
              setState(() {
                task.deleteTask();
                task.backgroundColor = task.isDone ? Colors.lightGreenAccent[700] :(task.dateTime!.isBefore(DateTime.now()) ? Colors.red: Colors.white);
              });
            })).toList());
        Home.listWidgets.add(SizedBox(height: 80,));
      });
      return Home.listWidgets;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('AP Todo App'),
        leading: Icon(
          Icons.task_alt,
          size: 35,
        ),
        titleSpacing: 0,
        // elevation: 0,
        backgroundColor: Colors.green[800],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/wallpaper.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 5,),
            Expanded(
              child: Scrollbar(
                child: ListView(
                  children:
                    getListWidgets()
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
            child: Creator(),
          ),
          FloatingActionButton(
            heroTag: "add",
            onPressed: (){
              Navigator.pushNamed(context, '/add_new_task').then((value) => setState(() {}));
            },
            child: Icon(Icons.add, size: 30,),
            backgroundColor: Colors.green[800],
          ),
        ],
      ),
    );
  }
}
