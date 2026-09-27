import 'package:flutter/material.dart';

import '../app_colors.dart';
import '../widgets/common_widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // The key is used to check if the form is valid
  final _formKey = GlobalKey<FormState>();

  // Controllers get the text typed by the user
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    // Go to Home only if all fields are filled in
    if (_formKey.currentState!.validate()) {
      // pushReplacementNamed replaces Login with Home,
      // so the Back button will not return to Login.
      Navigator.pushReplacementNamed(
        context,
        '/home',
        arguments: _emailController.text.trim(), // data sent to Home
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
      icon: Icons.lock_outline,
      title: 'Welcome back',
      subtitle: 'Log in to continue',
      child: Column(
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextField(
                  controller: _emailController,
                  label: 'Email or username',
                  icon: Icons.person_outline,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your email or username';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: _passwordController,
                  label: 'Password',
                  icon: Icons.lock_outline,
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          PrimaryButton(text: 'Log in', onPressed: _login),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Don't have an account?",
                style: TextStyle(color: AppColors.textGrey),
              ),
              TextButton(
                onPressed: () {
                  // pushNamed opens Sign-Up on top of Login
                  Navigator.pushNamed(context, '/signup');
                },
                child: const Text(
                  'Sign up',
                  style: TextStyle(
                    color: AppColors.accent,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
