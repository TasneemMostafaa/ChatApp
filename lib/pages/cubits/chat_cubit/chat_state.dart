part of 'chat_cubit.dart';

@immutable
sealed class ChatState {}

final class ChatInitial extends ChatState {}

class ChatSuccess extends ChatState{
  List<Message> messages=[];
  ChatSuccess({required this.messages});
}