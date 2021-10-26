import 'package:flutter/material.dart';
import 'package:hotel_b/widgets/text_field.dart';
import 'package:lottie/lottie.dart';

class BookScreen extends StatefulWidget {
  static const String namedRout = '/book_screen';

//  const BookScreen({Key? key}) : super(key: key);

  @override
  _BookScreenState createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(vsync: this, );
    controller.addStatusListener((status) async{
      if(status== AnimationStatus.completed){
        Navigator.pop(context);
        controller.reset();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController phone = TextEditingController();
    void showDoneDialog() {
      showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Lottie.asset(
                      'assets/booking.json',
                      repeat: false,
                      controller: controller,
                  onLoaded: (composition){
                        controller.duration=composition.duration;
                        controller.forward();
                  }),
                  Text('Enjoy your reservation',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                  SizedBox(height: 5,)
                ],
              ),
            );
          });
    }

    return Scaffold(
      floatingActionButton: ElevatedButton(
        onPressed: () {
          showDoneDialog();

        },
        child: SingleChildScrollView(
          child: Container(
              width: 200,
              height: 40,
              child: Center(
                  child: Text(
                'BOOK HERE',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ))),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: [
            Image.network(
                'https://www.webrezpro.com/wp-content/uploads/2020/10/video-hotel-reservation-software.jpg'),
            const SizedBox(
              height: 60,
            ),
            TextFieldd(
              hintText: 'your name',
              text: name,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFieldd(
              hintText: 'Phone Number',
              text: phone,
            ),
          ],
        ),
      ),
    );
  }
}
