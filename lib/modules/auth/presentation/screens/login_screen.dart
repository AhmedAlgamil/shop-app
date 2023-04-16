import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_layout/modules/auth/presentation/screens/register_screen.dart';
import 'package:shopping_layout/modules/auth/presentation/store/auth_cubit.dart';

import '../components/my_text_form_field.dart';
import '../store/auth_states.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {
          if (state is LoginLoadedState) {
            if (!AuthCubit.get(context).userDataModel!.status!) {
              Flushbar(
                title:  "error",
                backgroundColor: Colors.red,
                message:  AuthCubit.get(context).userDataModel!.message!,
                duration:  const Duration(seconds: 3),
              ).show(context);
            }else{
              Flushbar(
                title:  "success",
                backgroundColor: Colors.green,
                message:  AuthCubit.get(context).userDataModel!.message!,
                duration:  const Duration(seconds: 3),
              ).show(context);
            }
          }
        },
        builder: (context, state) {
          final cubit = AuthCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.black),
              backgroundColor: Colors.black,
            ),
            body: Container(
              padding: const EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height,
              color: Colors.black,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50),
                    const Image(
                      image: AssetImage("assets/images/kimit.png"),
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 50),
                    DefaultTextStyle(
                      style: const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                      child: AnimatedTextKit(
                        animatedTexts: [
                          WavyAnimatedText('Shopping App'),
                        ],
                        isRepeatingAnimation: true,
                        onTap: () {
                          print("Tap Event");
                        },
                      ),
                    ),
                    const SizedBox(height: 50),
                    MyTextFormField(
                      controller: emailController,
                      label: "email",
                      validationText: "email is required",
                      textInputType: TextInputType.emailAddress,
                      prefixIcon: const Icon(Icons.email),
                    ),
                    const SizedBox(height: 20),
                    MyTextFormField(
                      controller: passwordController,
                      label: "password",
                      validationText: "password is required",
                      prefixIcon: const Icon(Icons.lock),
                      obscureText: true,
                    ),
                    const SizedBox(height: 15),
                    if (state is! LoginLoadingState)
                      Container(
                        width: double.infinity,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () {
                            cubit.login(email: emailController.text, password: passwordController.text);
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    if (state is LoginLoadingState)
                      Container(
                        width: double.infinity,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const SizedBox(
                              height: 25,
                              width: 25,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              )),
                        ),
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("create new account", style: TextStyle(color: Colors.white)),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (ctx) => BlocProvider.value(
                                        value: BlocProvider.of<AuthCubit>(context), child: RegisterScreen()),
                                  ));
                            },
                            child: Text(
                              "Register",
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
