part of 'chat_cubit.dart';

@immutable
sealed class ChatState {}

final class ChatInitial extends ChatState {}
final class ChatSucess extends ChatState {
List<Message>message;

ChatSucess({required this.message});
}