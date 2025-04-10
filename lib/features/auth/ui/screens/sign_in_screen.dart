import 'package:ecommerce/app/app_colors.dart';
import 'package:ecommerce/core/extensions/localization_extension.dart';
import 'package:ecommerce/features/auth/ui/screens/sign_up_screen.dart';
import 'package:ecommerce/features/auth/ui/widget/app_logo.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const String name = '/sign-in';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 100),
                const AppLogo(),
                const SizedBox(height: 16),
                Text(
                  context.localization.welcomeBack,
                  style: textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  context.localization.enterEmailAndPassword,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _emailTEController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: context.localization.email,
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _passwordTEController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: context.localization.password,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(context.localization.signIn),
                ),
                const SizedBox(height: 24),
                _buildSignUpSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpSection() {
    return RichText(
      text: TextSpan(
        text: context.localization.doNotAccount,
        style: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w600,
        ),
        children: [
          TextSpan(
            text: context.localization.signUp,
            style: const TextStyle(
              color: AppColors.themeColor,
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()..onTap = _onTabSignUpButton,
          ),
        ],
      ),
    );
  }

  void _onTabSignUpButton() {
    Navigator.pushNamed(context, SignUpScreen.name);
  }

  @override
  void dispose(){
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
