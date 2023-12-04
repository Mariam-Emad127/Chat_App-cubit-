import 'package:bloc/bloc.dart';
import 'package:chat_application/models/message.dart';
import 'package:chat_application/widget/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  CollectionReference messages = FirebaseFirestore.instance.collection(kMessagesCollections);


  void sendMessage({required String message, required String email}){

      messages.add({'message': messages,  kCreatedAt:DateTime.now(),"id":email });
  }
List<Message>messageList=[];
void getMessage(){
messages.orderBy(kCreatedAt,descending: true).snapshots().listen((event) {


for(var doc in event.docs ){
messageList.add(Message.fromJson(doc));

}

  emit(ChatSucess(message:messageList));
  
  });

}



}
