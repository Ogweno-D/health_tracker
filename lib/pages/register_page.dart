import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health_tracker/components/my_button.dart';
import 'package:health_tracker/components/my_textfield.dart';
import 'package:health_tracker/helpers/helper_functions.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void registerUser() async {
      //show dialog
      showDialog(
          context: context,
          builder: (context) => const Center(
                child: CircularProgressIndicator(),
              ));
      //Check if passwords match
      if (passwordController.text != confirmPassController.text) {
        //pop the loading circle
        Navigator.pop(context);

        //Display Error Message
        displayMessageToUser("Passwords don't match", context);
      }
      //If the password match
       else {
        //Try creating a user
        try {
          UserCredential? userCredential = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: emailController.text,
                  password: passwordController.text);

          // Pop the loading circle
          Navigator.pop(context);
        } on FirebaseAuthException catch (e) {
          //Pop the loadning circle
          Navigator.pop(context);

          //Display error message to User
          displayMessageToUser(e.code, context);
        }
      }
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
                  height: 15,
                ),
                //app name
                const Text(
                  " H E A L T H   T R A C K E R",
                  style: TextStyle(fontSize: 20),
                ),

                const SizedBox(
                  height: 20,
                ),
                //Username
                MyTextfield(
                    hintText: "Enter your ussername",
                    controller: usernameController,
                    obscureText: false),

                const SizedBox(
                  height: 10,
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

                //Password Textfield
                MyTextfield(
                    hintText: " Confirm Password",
                    controller: confirmPassController,
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

                //Register
                MyButton(text: "Register", onTap: registerUser),

                const SizedBox(
                  height: 10,
                ),
                //Dont have an account?
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?  "),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        "Login here",
                        style: TextStyle(fontWeight: FontWeight.bold),
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
