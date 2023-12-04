part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterCubitInitial extends RegisterState {}
final class RegisterCubitLoading extends RegisterState {}
final class RegisterCubitSuccess extends RegisterState {}
final class RegisterCubitFailure extends RegisterState {
String errorMessage;

RegisterCubitFailure({required this.errorMessage});


}