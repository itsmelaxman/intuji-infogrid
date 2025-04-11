import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../src.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _handleLogin(BuildContext context) async {
    if (_formKey.currentState?.validate() ?? false) {
      final loginProvider = Provider.of<LoginProvider>(context, listen: false);
      await loginProvider.login(
        context,
        emailController.text.trim(),
        passwordController.text.trim(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(Assets.bgPattern, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Consumer<LoginProvider>(
              builder: (context, loginProvider, child) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(Assets.logo),
                    const SizedBox(height: 24.0),
                    const Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          CustomTextField(
                            hintText: 'Email or Username',
                            controller: emailController,
                            validation:
                                (value) => Validator.validateEmail(value),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 16.0),
                          CustomTextField(
                            hintText: 'Password',
                            controller: passwordController,
                            validation:
                                (value) => Validator.validatePassword(value),
                            isPassword: true,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    loginProvider.status == DataFetchStatus.loading
                        ? const CircularProgressIndicator()
                        : CustomMaterialButton(
                          text: 'Sign In',
                          onPressed: () => _handleLogin(context),
                        ),
                    const SizedBox(height: 16.0),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Forgot your password?'),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Powered by '),
                        Image.asset(Assets.poweredByLogo, height: 20.0),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
