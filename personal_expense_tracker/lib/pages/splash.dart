import 'package:flutter/material.dart';

import '../controllers/db_helper.dart';
import 'add_name.dart';
import 'home_page.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  DbHelper dbHelper = DbHelper();
  Future getSettings() async {
    String? name = await dbHelper.getName();
    if (name != null) {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomePage()));
    } else {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const AddName()));
    }
  }

  @override
  void initState() {
    super.initState();
    getSettings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0.0,
        ),
        backgroundColor: const Color(0xffe2e7ef),

        //body
        body: Center(
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.all(10),
              width: 64,
              height: 64,
              child: Image.asset(
                "assets/images/pay.png",
                scale: 0.2,
              )
              // const Icon(
              //   Icons.attach_money_outlined,
              //   size: 40,
              //   color: Colors.black,
              // )),
              ),
        ));
  }
}
