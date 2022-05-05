import 'all.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      initialRoute: '/home',
      routes: {
        '/': (context) => Opening(),
        '/home': (context) => Home(),
        '/add_new_task': (context) => AddNewTask(),
        '/task_details': (context) => TaskDetails(),
      },
    ),
  );
}