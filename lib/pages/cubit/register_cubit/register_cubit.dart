import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit () : super(RegisterCubitInitial());

Future<void> registerUser({required String email, required String password}) async {
    emit(RegisterCubitLoading());
    try{
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
 emit(RegisterCubitSuccess());
  } on FirebaseException catch (ex) {
      if (ex.code == 'weak-password') {
        emit(RegisterCubitFailure(errorMessage: "weak password"));
      } else if (ex.code == 'email-already-in-use') {
        emit(RegisterCubitFailure(errorMessage: 'email already exists'));

      }
    } catch (e) {
      emit(RegisterCubitFailure(errorMessage: 'there was an error'));
    }
  } 








}
