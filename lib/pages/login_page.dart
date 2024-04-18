import 'package:flutter/material.dart';
import 'package:health_tracker/components/my_button.dart';
import 'package:health_tracker/components/my_textfield.dart';

class LoginPage extends StatelessWidget {
  
  final void Function()? onTap;
 
  LoginPage({super.key,
  required this.onTap
  });
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    void login(){

    }
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Logo
                Icon(
                  Icons.person,
                  size: 80,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),

                const SizedBox(
                  height: 25,
                ),
                //app name
                const Text(
                  " H E A L T H   T R A C K E R",
                  style: TextStyle(fontSize: 20),
                ),

                const SizedBox(
                  height: 50,
                ),

                //Email textField
                MyTextfield(
                    hintText: "Enter your email",
                    controller: emailController,
                    obscureText: false),

                const SizedBox(
                  height: 10,
                ),

                //Password Textfield
                MyTextfield(
                    hintText: "Password",
                    controller: passwordController,
                    obscureText: true),

                const SizedBox(
                  height: 10,
                ),

                //Forgot Password
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Forgot Password ?",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 20,
                ),
                //SigninButton
                MyButton(text: "Login", onTap: login),

              const SizedBox(height: 10,),
                //Dont have an account?
               Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?  "),
                    GestureDetector(
                      onTap: onTap,
                      child: const Text(
                        "Register here",
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                        ),
                    )

                    ],
                )
              ],
            ),
          ),
        ));
  }
}
