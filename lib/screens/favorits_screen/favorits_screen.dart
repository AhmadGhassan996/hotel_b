import 'package:flutter/material.dart';
import 'package:hotel_b/providers/favorites_provider.dart';
import 'package:hotel_b/screens/favorits_screen/widgets/body_after_db.dart';
import 'package:hotel_b/screens/favorits_screen/widgets/body_before_db.dart';
import 'package:hotel_b/services/hotel_respons.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesScreen extends StatefulWidget {
  static const String namedRout = '/favorites_screen';

  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  void initState() {
    // TODO: implement initState

    Future.delayed(Duration(milliseconds: 100)).then((value) async {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      context.read<FVProvider>().getFv(preferences.getString('userId'));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var watcher = context.watch<FVProvider>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: watcher.hbResponse.status == Status.FRESH
          ? Center(
              child: Container(
                child: BodyBefore(),
              ),
            )
          : watcher.hbResponse.status == Status.LOADING
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: watcher.hbResponse.data!.length,
                  itemBuilder: (ctx, index) {
                    return BodyAfter(index: index);
                  }),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: -20,
        title: Text(
          "You Favorites ",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    );
  }
}
