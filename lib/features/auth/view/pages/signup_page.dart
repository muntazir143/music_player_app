import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:music_player_app/core/theme/app_pallete.dart';
import 'package:music_player_app/features/auth/repositories/auth_remote_repository.dart';
import 'package:music_player_app/features/auth/view/widgets/auth_gradient_button.dart';
import 'package:music_player_app/features/auth/view/widgets/custom_field.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Pallete.transparentColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Sign Up.",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomField(
                hintText: "Name",
                controller: nameController,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomField(
                hintText: "Email",
                controller: emailController,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomField(
                hintText: "Password",
                controller: passwordController,
                isObscureText: true,
              ),
              const SizedBox(
                height: 15,
              ),
              AuthGradientButton(
                text: "Sign Up",
                onPressed: () async {
                  final res = await AuthRemoteRepository().signup(
                      name: nameController.text,
                      email: emailController.text,
                      password: passwordController.text);

                  final val = switch (res) {
                    Left(value: final l) => l,
                    Right(value: final r) => r.toString(),
                  };
                },
              ),
              const SizedBox(
                height: 20,
              ),
              RichText(
                text: TextSpan(
                  text: "Already have an account? ",
                  style: Theme.of(context).textTheme.titleMedium,
                  children: const [
                    TextSpan(
                      text: "Sign In",
                      style: TextStyle(
                        color: Pallete.gradient2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
