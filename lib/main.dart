 
import 'package:chat_application/pages/cubit/login_cubit/cubit/login_cubit.dart';
import 'package:chat_application/pages/cubit/register_cubit/register_cubit.dart';
import 'package:chat_application/pages/login_screen.dart';
import 'package:chat_application/pages/resgister_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'pages/chat_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),        
  BlocProvider(create: (context) => RegisterCubit()),     
        ],
     // create: (context) => LoginCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        routes: {
          RegisterPage().id: (context) => RegisterPage(),
          LoginPage.id: (context) => LoginPage(),
          ChatPage.id: (context) => ChatPage()
        },
        initialRoute: "LoginPage",
      ),
    );
  }
}



   