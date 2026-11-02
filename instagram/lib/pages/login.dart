import 'package:flutter/material.dart';
import 'package:instagram/pages/homePage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static const instagramBlue = Color(0xFF3797EF);

  final loginController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool hidePassword = true;

  @override
  void dispose() {
    loginController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void openHomePage() {
    if (!(formKey.currentState?.validate() ?? false)) return;

    Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(builder: (_) => const HomePage()),
    );
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), behavior: SnackBarBehavior.floating),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            if (Navigator.of(context).canPop()) Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Color(0xFF262626),
            size: 22,
          ),
        ),
      ),
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 420),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(height: 18),
                          Center(
                            child: Image.asset(
                              'assets/images/logo-instagram.png',
                              width: 158,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Text(
                                    'Instagram',
                                    style: TextStyle(
                                      color: Color(0xFF262626),
                                      fontSize: 34,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                            ),
                          ),
                          const SizedBox(height: 55),
                          _LoginField(
                            controller: loginController,
                            hintText: 'Login',
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Enter your login';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 12),
                          _LoginField(
                            controller: passwordController,
                            hintText: 'Password',
                            obscureText: hidePassword,
                            textInputAction: TextInputAction.done,
                            onSubmitted: (_) => openHomePage(),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter your password';
                              }
                              return null;
                            },
                            suffixIcon: IconButton(
                              onPressed: () => setState(
                                () => hidePassword = !hidePassword,
                              ),
                              icon: Icon(
                                hidePassword
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                size: 20,
                                color: const Color(0xFF8E8E8E),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () =>
                                  showMessage('Password recovery selected'),
                              style: TextButton.styleFrom(
                                foregroundColor: instagramBlue,
                                padding: const EdgeInsets.symmetric(vertical: 14),
                                minimumSize: Size.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: const Text(
                                'Forgot password?',
                                style: TextStyle(fontSize: 13),
                              ),
                            ),
                          ),
                          const SizedBox(height: 28),
                          SizedBox(
                            height: 48,
                            child: ElevatedButton(
                              onPressed: openHomePage,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: instagramBlue,
                                foregroundColor: Colors.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              child: const Text(
                                'Log in',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 28),
                          TextButton.icon(
                            onPressed: () =>
                                showMessage('Facebook login selected'),
                            style: TextButton.styleFrom(
                              foregroundColor: instagramBlue,
                            ),
                            icon: const CircleAvatar(
                              radius: 10,
                              backgroundColor: Color(0xFF262626),
                              child: Text(
                                'f',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            label: const Text(
                              'Log in with Facebook',
                              style: TextStyle(fontSize: 13),
                            ),
                          ),
                          const SizedBox(height: 28),
                          const Row(
                            children: [
                              Expanded(child: Divider(color: Color(0xFFDBDBDB))),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  'OR',
                                  style: TextStyle(
                                    color: Color(0xFF8E8E8E),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Expanded(child: Divider(color: Color(0xFFDBDBDB))),
                            ],
                          ),
                          const SizedBox(height: 22),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Don't have an account? ",
                                style: TextStyle(
                                  color: Color(0xFF8E8E8E),
                                  fontSize: 12,
                                ),
                              ),
                              GestureDetector(
                                onTap: () => showMessage('Sign up selected'),
                                child: const Text(
                                  'Sign up.',
                                  style: TextStyle(
                                    color: instagramBlue,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 28),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Divider(height: 1, color: Color(0xFFDBDBDB)),
            const SizedBox(
              height: 58,
              child: Center(
                child: Text(
                  'Instagram from Facebook',
                  style: TextStyle(color: Color(0xFFC7C7C7), fontSize: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LoginField extends StatelessWidget {
  const _LoginField({
    required this.controller,
    required this.hintText,
    required this.textInputAction,
    required this.validator,
    this.keyboardType,
    this.obscureText = false,
    this.suffixIcon,
    this.onSubmitted,
  });

  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboardType;
  final TextInputAction textInputAction;
  final bool obscureText;
  final Widget? suffixIcon;
  final String? Function(String?) validator;
  final ValueChanged<String>? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      obscureText: obscureText,
      validator: validator,
      onFieldSubmitted: onSubmitted,
      style: const TextStyle(color: Color(0xFF262626), fontSize: 14),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Color(0xFF8E8E8E), fontSize: 14),
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: const Color(0xFFFAFAFA),
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF8E8E8E)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF262626), width: 1.2),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFED4956)),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFED4956), width: 1.2),
        ),
      ),
    );
  }
}
