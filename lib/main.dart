import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:chatting_app/red_page.dart';
import 'package:chatting_app/green_page.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      routes: {
        // "red" : (_) => RedPage(),

      },
    );
  }
}


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState(){
    super.initState();

    FirebaseMessaging.instance.getInitialMessage();

    FirebaseMessaging.onMessage.listen((message) {
      if(message.notification != null){
        print(message.notification!.title);
        print(message.notification!.body);
      }
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chatting App"),
        backgroundColor: Colors.red,
      ),
      body: Container(
        child: Center(child: Text("Some Text Lol")),
      ),
    );
  }
}

