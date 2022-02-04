import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  // const ChatScreen({ Key? key }) : super(key: key);
static const String  screenRoute = 'chat_screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _fireStore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  User singedInUser ;
  String messageText;
@override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser(){
    try {
      final user = _auth.currentUser;
      if(user != null){
        singedInUser = user;
        print(singedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  // void getMessages () async{
  //   final messages = await _fireStore.collection('messages').get();
  //   for(var message in messages.docs){
  //     print(message.data());
  //   }
  // }

  void messageSnapshot() async{
    await for(var snapshot in _fireStore.collection('messages').snapshots()){
      for(var message in snapshot.docs){
        print(message.data());
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        title: Row(children: [
          SizedBox(width: 10),
          Image.asset('images/icon.png', height: 35),
          SizedBox(width: 15),
          Text("Talk"),
        ]),
        actions: [IconButton(icon: Icon(Icons.close), onPressed: () {
          // _auth.signOut();
          // Navigator.pop(context);
          messageSnapshot();
        })],
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(),
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.blue[400], width: 2),
              ),
            ),
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Expanded(
                child: TextField(
                  onChanged: (value) {
                    messageText = value;
                  },
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    hintText: 'Write your message here....',
                    border: InputBorder.none,
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {
                    _fireStore.collection('messages').add(
                      {
                        'text' : messageText,
                        'sender' : singedInUser.email,
                      }
                    );
                  },
                  child: Text("Send",
                      style: TextStyle(
                          color: Color(0xFF6BC392),
                          fontWeight: FontWeight.bold,
                          fontSize: 18)))
            ]),
          )
        ],
      )),
    );
  }
}
