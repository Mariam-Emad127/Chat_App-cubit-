import 'package:chat_application/models/message.dart';
import 'package:chat_application/pages/cubit/chat_cubit/cubit/chat_cubit.dart';
import 'package:chat_application/widget/chat_buble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widget/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatPage extends StatelessWidget {
  static String id = 'ChatPage';
  final _controller = ScrollController();
   TextEditingController controller = TextEditingController();
     var messageList;
     late String email;
  @override
  Widget build(BuildContext context) {
   // String email = ModalRoute.of(context)!.settings.arguments;
    // return
    /* StreamBuilder<QuerySnapshot>(
     //   future: messages.doc("0YeCMWb6WEbShLtVZ19Y").get(),
        stream: messages.orderBy(kCreatedAt,descending: true).snapshots(),
        builder:  (context,snapshot){

          //print(snapshot.data!.docs[0]["message"] );

          if(snapshot.hasData) {
            List <Message>messageList=[];
            for(int i=0; i<snapshot.data!.docs.length;i++){
              messageList.add(Message.fromJson(snapshot.data!.docs[i]));
            } */
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              kLogo,
              height: 50,
            ),
            Text('chat'),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(children: [
        Expanded(
          child: BlocBuilder<ChatCubit, ChatState>(
  

            builder: (context, state) {
              
            var messageList=BlocProvider.of<ChatCubit>(context).messageList;
              return ListView.builder(
                reverse: true,
                controller: _controller,
                itemCount: messageList.length,
                itemBuilder: (context, index) {
                  return messageList[index].id == email
                      ? ChatBuble(
                          message: messageList[index],
                        )
                      : ChatBubleForFriend(message: messageList[index]);
                },
              );
            },
          ),
        ),
        Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              controller: controller,
              onSubmitted: (data) {
                BlocProvider.of<ChatCubit>(context).sendMessage(message: data, email: email);
                controller.clear();
                _controller.animateTo(
                  // _controller.position.maxScrollExtent,
                  0,
                  curve: Curves.easeOut,
                  duration: const Duration(milliseconds: 500),
                );
              },
              decoration: InputDecoration(
                  hintText: 'Send Message',
                  suffixIcon: Icon(
                    Icons.send,
                    color: kPrimaryColor,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: kPrimaryColor))),
            ))
      ]),
    );
 
  }
}
