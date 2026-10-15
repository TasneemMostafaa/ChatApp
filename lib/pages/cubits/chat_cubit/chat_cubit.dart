import 'package:bloc/bloc.dart';
import 'package:chatapp/constants.dart';
import 'package:chatapp/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  CollectionReference messages = FirebaseFirestore.instance.collection(
    kMessagesCollection,
  );

List<Message> messageList = [];

  Future<void> sendMessage({required String msg, required String email})async{
    try{ await messages.add({
                        kMessage: msg,
                        kCreatedAt: DateTime.now(),
                        kId: email,
                      });
  }on Exception catch(e){

  }
  }


  void getMessages(){
    messages.orderBy(kCreatedAt, descending: true).snapshots().listen((event){
      
      messageList.clear();
      for(var doc in event.docs){
        messageList.add(Message.fromJson(doc));
        
      }
      
      emit(ChatSuccess(messages: messageList));
    });
  }
}
