import '../all.dart';

class Opening extends StatefulWidget {
  @override
  _OpeningState createState() => _OpeningState();
}
class _OpeningState extends State<Opening> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                Home()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/opening-logo.png', width: 200,),
        ],
      ),
    );
  }
}

