import 'package:ecommerce/app/app_colors.dart';
import 'package:ecommerce/core/extensions/localization_extension.dart';
import 'package:ecommerce/core/widget/centered_circular_progress_indicator.dart';
import 'package:ecommerce/core/widget/show_snack_bar_message.dart';
import 'package:ecommerce/features/auth/data/model/sign_up_model.dart';
import 'package:ecommerce/features/auth/ui/controllers/sign_up_controller.dart';
import 'package:ecommerce/features/auth/ui/screens/sign_in_screen.dart';
import 'package:ecommerce/features/auth/ui/screens/verify_otp_screen.dart';
import 'package:ecommerce/features/auth/ui/widget/app_logo.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  final SignUpController _signUpController = Get.find<SignUpController>();

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
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              hintText: context.localization.firstName,
            ),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter Your First Name';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _lastNameTEController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              hintText: context.localization.lastName,
            ),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter Your Last Name';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _mobileTEController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              hintText: context.localization.mobile,
            ),
            validator: (String? value) {
              String phoneNumber = value ?? '';
              RegExp regExp = RegExp(r'^(?:/+88|88)?01[3-9]\d{8}$');
              if (regExp.hasMatch(phoneNumber) == false) {
                return 'Enter Your Valid Phone Number';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _emailTEController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: context.localization.email,
            ),
            validator: (String? value) {
              String email = value ?? '';
              if (!EmailValidator.validate(email)) {
                return 'Enter Your Valid Email';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _passwordTEController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              hintText: context.localization.password,
            ),
            validator: (String? value) {
              if ((value?.isEmpty ?? true) || value!.length < 6) {
                return 'Enter a Password 6 Letter';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _deliveryAddressTEController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              hintText: context.localization.deliveryAddress,
            ),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter Your Delivery Address';
              }
              return null;
            },
            maxLines: 3,
          ),
          const SizedBox(height: 16),
          GetBuilder<SignUpController>(builder: (controller) {
            return Visibility(
              visible: controller.inProgress == false,
              replacement: const CenteredCircularProgressIndicator(),
              child: ElevatedButton(
                onPressed: () {
                  _onTabSignUpButton();
                },
                child: Text(context.localization.signUp),
              ),
            );
          }),
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

  Future<void> _onTabSignUpButton() async {
    if (_formKey.currentState!.validate()) {
      SignUpModel signUpModel = SignUpModel(
        fistName: _firstnameTEController.text.trim(),
        lastName: _lastNameTEController.text.trim(),
        email: _emailTEController.text.trim(),
        password: _passwordTEController.text,
        mobileNumber: _mobileTEController.text.trim(),
        deliveryAddress: _deliveryAddressTEController.text.trim(),
      );
      final bool isSuccess  = await _signUpController.signUp(signUpModel);

      if(isSuccess) {
        Navigator.pushNamed(context, VerifyOtpScreen.name);
      } else{
        showSnackBarMessage(context, _signUpController.errorMessage!, true);
      }
    }
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
