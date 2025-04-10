import 'package:ecommerce/app/app_colors.dart';
import 'package:ecommerce/core/extensions/localization_extension.dart';
import 'package:ecommerce/features/auth/ui/screens/sign_in_screen.dart';
import 'package:ecommerce/features/auth/ui/screens/verify_otp_screen.dart';
import 'package:ecommerce/features/auth/ui/widget/app_logo.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String name = '/sign-up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _firstnameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _deliveryAddressTEController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: _buildForm(textTheme),
        ),
      ),
    );
  }

  Widget _buildForm(TextTheme textTheme) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(height: 60),
          const AppLogo(),
          const SizedBox(height: 16),
          Text(
            context.localization.registerYourAccount,
            style: textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            context.localization.getStartWithDetails,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _firstnameTEController,
            decoration: InputDecoration(
              hintText: context.localization.firstName,
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _lastNameTEController,
            decoration: InputDecoration(
              hintText: context.localization.lastName,
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _mobileTEController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              hintText: context.localization.mobile,
            ),
          ),
          const SizedBox(height: 8),
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
            decoration: InputDecoration(
              hintText: context.localization.password,
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _deliveryAddressTEController,
            decoration: InputDecoration(
              hintText: context.localization.deliveryAddress,
            ),
            maxLines: 3,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              _onTabVerifyOtpButton();
            },
            child: Text(context.localization.signUp),
          ),
          const SizedBox(height: 24),
          _buildSignInSection(),
        ],
      ),
    );
  }

  Widget _buildSignInSection() {
    return RichText(
      text: TextSpan(
        text: context.localization.haveAccount,
        style: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w600,
        ),
        children: [
          TextSpan(
            text: context.localization.signIn,
            style: const TextStyle(
              color: AppColors.themeColor,
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()..onTap = _onTabSignInButton,
          ),
        ],
      ),
    );
  }


  void _onTabSignInButton() {
    Navigator.pushNamed(context, SignInScreen.name);
  }

  void _onTabVerifyOtpButton(){
    Navigator.pushNamed(context, VerifyOtpScreen.name);
  }

  @override
  void dispose() {
    _firstnameTEController.dispose();
    _lastNameTEController.dispose();
    _mobileTEController.dispose();
    _emailTEController.dispose();
    _passwordTEController.dispose();
    _deliveryAddressTEController.dispose();
    super.dispose();
  }
}
