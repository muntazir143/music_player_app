import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fpdart/fpdart.dart';
import 'package:music_player_app/core/theme/app_pallete.dart';
import 'package:music_player_app/features/auth/repositories/auth_remote_repository.dart';
import 'package:music_player_app/features/auth/view/widgets/auth_gradient_button.dart';
import 'package:music_player_app/features/auth/view/widgets/custom_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
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
                "Sign In.",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
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
                text: "Sign In",
                onPressed: () async {
                  final res = await AuthRemoteRepository().login(
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
              GestureDetector(
                onTap: () {},
                child: RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: Theme.of(context).textTheme.titleMedium,
                    children: const [
                      TextSpan(
                        text: "Sign Up",
                        style: TextStyle(
                          color: Pallete.gradient2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
