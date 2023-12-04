import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());


 Future<dynamic> loginUser({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      UserCredential user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);

 return  user;        
      emit(LoginSuccess());
      
    }  on FirebaseException catch (ex) {
      if (ex.code == 'weak-password') {
        emit(LoginFailure(errorMessage: "weak password"));
      } else if (ex.code == 'email-already-in-use') {
        emit(LoginFailure(errorMessage: 'email already exists'));

      }
    } catch (e) {
      emit(LoginFailure(errorMessage: 'there was an error'));
    }

  } 

    


}
