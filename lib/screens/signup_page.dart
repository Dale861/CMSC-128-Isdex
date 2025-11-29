import 'package:flutter/material.dart';
import 'theme.dart';


class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 24),
              Container(
                decoration: BoxDecoration(
                  color: kBackground,
                  borderRadius: BorderRadius.circular(24),
                ),
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: kBackground,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: Image.asset(
                            'assets/images/isdex_logo.png',
                            height: 40,
                            width: 40,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'IsDex',
                          style: TextStyle(
                            color: kDarkNavy,
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Container(
                      decoration: BoxDecoration(
                        color: kLightBlue,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Center(
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: kDarkNavy,
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          const Text(
                            'Name',
                            style: TextStyle(
                              color: kDarkNavy,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const _FormField(hint: 'Enter username'),
                          const SizedBox(height: 16),
                          const Text(
                            'Email',
                            style: TextStyle(
                              color: kDarkNavy,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const _FormField(
                            hint: 'Enter email',
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Password',
                            style: TextStyle(
                              color: kDarkNavy,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const _FormField(
                            hint: 'Enter password',
                            obscure: true,
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Enter Password Again',
                            style: TextStyle(
                              color: kDarkNavy,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const _FormField(
                            hint: 'Re-enter password to confirm',
                            obscure: true,
                          ),
                          const SizedBox(height: 24),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                // TODO: sign-up logic
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: kAccentBlue,
                                padding: const EdgeInsets.symmetric(vertical: 14),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: const Text(
                                'Welcome Diver!',
                                style: TextStyle(
                                  color: kDarkNavy,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ],
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


class _FormField extends StatelessWidget {
  final String hint;
  final bool obscure;
  final TextInputType keyboardType;

  const _FormField({
    required this.hint,
    this.obscure = false,
    this.keyboardType = TextInputType.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscure,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
