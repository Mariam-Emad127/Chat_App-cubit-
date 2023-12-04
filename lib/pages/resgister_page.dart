import 'package:chat_application/pages/cubit/register_cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../helper/show_snack_bar.dart';
import '../widget/Custom_button.dart';
import '../widget/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'chat_page.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  String id = " RegisterPage";

  String? email;

  String? password;
  bool isloading = false;
  GlobalKey<FormState> formKey = GlobalKey();

  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
            if(state is RegisterCubitLoading){
        isloading=true;
       }else if(state is RegisterCubitSuccess){
  Navigator.pushNamed(context, ChatPage.id);
  isloading=false;

       }else if (state is RegisterCubitFailure){
        showSnackBar(context, state.errorMessage);
        isloading=false;

       }
      },
      builder:(context,state)=> ModalProgressHUD(
        inAsyncCall: isloading,
        child: Scaffold(
          backgroundColor: Color(0xff2B475E),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            //child: ListView(
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Image.asset(
                    "assets/images/scholar.png",
                    height: 100,
                  ),
                  Text(
                    "Scholar Chat",
                    style: (TextStyle(
                        fontSize: 30,
                        fontFamily: "Pacifico",
                        color: Colors.white)),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Row(
                    children: [
                      Text(
                        "REGISTER",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    hintText: "Email",
                    onChanged: (data) {
                      email = data;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                      obscureText: true,
                      hintText: "Password",
                      onChanged: (data) {
                        password = data;
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomButon(
                    text: "Register",
                    onTab: () async {
                      // var auth=FirebaseAuth.instance;
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<RegisterCubit>(context).registerUser(email: email!, password: password!);
                        
                      } else {}
                    },
                  ),
                  const SizedBox(height: 10),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(
                      'already have an account?',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context, "Loginpage");
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Color(0xffC7EDE6),
                        ),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
          ),
          //),
        ),
      ),
    );
  }
}
