import 'all.dart';

class Creator extends StatelessWidget {
  const Creator({Key? key}) : super(key: key);
  final Color white=Colors.white;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 56,
          child: FloatingActionButton.extended(
            heroTag: 'creator',
            icon: Icon(Icons.code, color: white, size: 30,),
            backgroundColor: Colors.green[800],
            onPressed: () {},
            label: Text('400243065', style: TextStyle(color: white, fontSize: 16),),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50)
              ),
            ),
        ),
      ]
    );
  }
}
