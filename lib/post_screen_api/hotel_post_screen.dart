import 'package:flutter/material.dart';
import 'package:hotel_b/post_screen_api/models.dart';
import 'package:hotel_b/widgets/text_field.dart';
import 'package:provider/provider.dart';

class HotelPostScreen extends StatefulWidget {
  const HotelPostScreen({Key? key}) : super(key: key);

  @override
  _HotelPostScreenState createState() => _HotelPostScreenState();
}

class _HotelPostScreenState extends State<HotelPostScreen> {
  late Facilities f;
  late Rooms rooms;
  late HotelApiPost hotelApi;

  Map<String, RoomScention> room() => {
        'r1': RoomScention(
            details: 'details',
            img1:
                'https://www.gannett-cdn.com/-mm-/05b227ad5b8ad4e9dcb53af4f31d7fbdb7fa901b/c=0-64-2119-1259/local/-/media/USATODAY/USATODAY/2014/08/13/1407953244000-177513283.jpg',
            img2:
                'https://storage.googleapis.com/static-content-hc/sites/default/files/cataloina_porto_doble_balcon2_2.jpg',
            img3:
                'https://www.princehotels.com/wp-content/uploads/2019/04/aboutslider2-1.jpg',
            img4:
                'https://www.gannett-cdn.com/-mm-/05b227ad5b8ad4e9dcb53af4f31d7fbdb7fa901b/c=0-64-2119-1259/local/-/media/USATODAY/USATODAY/2014/08/13/1407953244000-177513283.jpg',
            img5: 'img5',
            isItAvalbale: false,
            isItRoom1: true,
            isItRoom2: false,
            isItRoom3: false,
            isItRoom4: false,
            price: '60'),
        'r2': RoomScention(
            details: 'details',
            img1: 'img1',
            img2: 'img2',
            img3: 'img3',
            img4: 'img4',
            img5: 'img5',
            isItAvalbale: false,
            isItRoom1: true,
            isItRoom2: false,
            isItRoom3: false,
            isItRoom4: false,
            price: '100'),
        'r3': RoomScention(
            details: 'details',
            img1: 'img1',
            img2: 'img2',
            img3: 'img3',
            img4: 'img4',
            img5: 'img5',
            isItAvalbale: false,
            isItRoom1: true,
            isItRoom2: false,
            isItRoom3: false,
            isItRoom4: false,
            price: '150'),
        'r4': RoomScention(
            details: 'details',
            img1: 'img1',
            img2: 'img2',
            img3: 'img3',
            img4: 'img4',
            img5: 'img5',
            isItAvalbale: false,
            isItRoom1: true,
            isItRoom2: false,
            isItRoom3: false,
            isItRoom4: false,
            price: '200'),
      };

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    rooms = Rooms(room());
    f = Facilities(
        f1: 'fv',
        f2: 'ammar',
        f3: 'sasdasd',
        f4: 'szxcqwqq',
        f5: 'sasdasdzxc',
        f6: 's',
        f8: 's',
        f9: 's');

    hotelApi = HotelApiPost(
        description: 'Here Is the Description',
        facilities: f,
        name: 'mohammad',
        img:
            'https://media-cdn.tripadvisor.com/media/photo-s/16/1a/ea/54/hotel-presidente-4s.jpg',
        longtud: 35.867756,
        louted: 32.010532,
        rooms: rooms);
  }

  void getPassword(String password) {
    _password = password;
  }

  void getEmail(String email) {
    _email = email;
  }

  String _password = '';
  String _email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            passwordTextField(),
            userNameTextField(),
            TextButton(
                onPressed: () {
                  //HotelApi(description:'hmad' ,facilities:f ,name:'a' );

                  ToFireBase().hotelApi(hotelApi, 'lan', 'lon');

//context.read<HotelApiProivder>().toFirebase(_email, _password);

                  print('Email; $_email');
                  print('password:$_password');
                },
                child: Text('post'))
          ],
        ),
      ),
    );
  }

  Widget passwordTextField() {
    return TextFormField(
      onChanged: getPassword,

      validator: (value) {
        if (value!.isEmpty) {
          return " please enter a password";
        } else if (value.length < 4) {
          return "please enter valid password";
        } else {
          return null;
        }
      },
      // onSaved: (value) => setState(() => _password = value!),
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {
            // setState(() {
            //   _sucre = !_sucre;
            // });
          },
          icon: Icon(Icons.visibility_off),
        ),
        labelText: "Enter password",
        filled: false,
        fillColor: Colors.grey[300],
        prefixIcon: Icon(Icons.lock),
        // enabledBorder: OutlineInputBorder(
        //   borderSide: BorderSide(color: Colors.transparent),
        //   borderRadius: BorderRadius.circular(10.0),
        // ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(10.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  } //password Widget

  Widget userNameTextField() {
    return TextFormField(
      onChanged: getEmail,
      validator: (value) {
        if (value!.isEmpty) {
          return " please enter a user name";
        } else if (value.length < 4) {
          return "please enter valid user name";
        } else {
          return null;
        }
      },
      //onSaved: (value) => setState(() => _userName = value!),
      decoration: InputDecoration(
        labelText: " UserName",
        filled: false,
        fillColor: Colors.grey[300],
        prefixIcon: Icon(Icons.person_outline_rounded),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(10.0),
        ),
        // enabledBorder: OutlineInputBorder(
        //   borderSide: BorderSide(color: Colors.transparent),
        //   borderRadius: BorderRadius.circular(10.0),
        // ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(10.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  } // User Name Text Field

}
