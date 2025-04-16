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
  bool isObscure = true;

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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Assets.logo, height: 50.0, alignment: Alignment.center),
            Container(
              height: 6.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0x0F000000),
                    Color(0xCAFADF2F),
                    Color(0x05000000),
                  ],
                  stops: [0.0, 0.5051, 1.0],
                ),
              ),
            ),
          ],
        ),
        backgroundColor: AppColors.kBlack,
      ),
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
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
                          _buildInputField(
                            controller: emailController,
                            hintText: 'Email or Username',
                            keyboardType: TextInputType.emailAddress,
                            validator: Validator.validateEmail,
                          ),
                          const SizedBox(height: 16.0),
                          _buildInputField(
                            controller: passwordController,
                            hintText: 'Password',
                            isPassword: true,
                            validator: Validator.validatePassword,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    loginProvider.status == DataFetchStatus.loading
                        ? const CircularProgressIndicator()
                        : CustomMaterialButton(
                          onPressed: () => _handleLogin(context),
                          text: 'Sign In',
                          elevation: 0.35,
                        ),
                    const SizedBox(height: 16.0),
                    CustomMaterialButton(
                      onPressed: () {},
                      text: 'Forgot Password?',
                      color: AppColors.kWhite,
                      elevation: 0.35,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: kToolbarHeight,
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Powered by '),
            Image.asset(Assets.poweredByLogo, height: 20.0),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String hintText,
    required String? Function(String?) validator,
    bool isPassword = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: TextFormField(
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        obscureText: isPassword ? isObscure : false,

        decoration: InputDecoration(
          hintText: hintText,
          filled: true,

          fillColor: AppColors.kWhite,
          labelText: hintText,
          suffix:
              isPassword
                  ? GestureDetector(
                    onTap: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },

                    child: Padding(
                      padding: EdgeInsets.only(right: 16.0),
                      child: Text(
                        isObscure ? 'SHOW' : 'HIDE',
                        style: AppStyles.text16PxMedium,
                      ),
                    ),
                  )
                  : null,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 12.0,
            horizontal: 16.0,
          ),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ),
    );
  }
}
