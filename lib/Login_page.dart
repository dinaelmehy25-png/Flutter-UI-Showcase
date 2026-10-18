import 'package:flutter/material.dart';

void main() {
  runApp(const GroceryApp());
}

class GroceryApp extends StatelessWidget {
  const GroceryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grocery Shop',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Arial',
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF40AA58),
        ),
      ),
      home: const SignUpPage(),
    );
  }
}

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController nameController =
      TextEditingController(text: 'Jon Dorman');

  final TextEditingController phoneController =
      TextEditingController(text: '+880171000000');

  final TextEditingController passwordController =
      TextEditingController(text: '1234567');

  bool isPasswordVisible = false;

  final Color primaryColor = const Color(0xFF40AA58);
  final Color darkColor = const Color(0xFF17172F);
  final Color greyColor = const Color(0xFF999999);

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 35,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 45),

              Text(
                'Welcome to our\ngrocery shop',
                style: TextStyle(
                  color: darkColor,
                  fontSize: 34,
                  fontWeight: FontWeight.w800,
                  height: 1.3,
                  letterSpacing: -0.8,
                ),
              ),

              const SizedBox(height: 45),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(
                  28,
                  50,
                  28,
                  40,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(38),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildLabel('Name'),

                    const SizedBox(height: 12),

                    buildTextField(
                      controller: nameController,
                      hint: 'Enter your name',
                    ),

                    const SizedBox(height: 42),

                    buildLabel('Phone Number'),

                    const SizedBox(height: 12),

                    buildTextField(
                      controller: phoneController,
                      hint: 'Enter your phone number',
                      keyboardType: TextInputType.phone,
                    ),

                    const SizedBox(height: 42),

                    buildLabel('Password'),

                    const SizedBox(height: 12),

                    TextField(
                      controller: passwordController,
                      obscureText: !isPasswordVisible,
                      decoration: InputDecoration(
                        hintText: 'Enter your password',
                        hintStyle: TextStyle(
                          color: greyColor,
                          fontSize: 16,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isPasswordVisible =
                                  !isPasswordVisible;
                            });
                          },
                          icon: Icon(
                            isPasswordVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: darkColor,
                            size: 21,
                          ),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 23,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFFE4E4E4),
                            width: 1.5,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: primaryColor,
                            width: 1.5,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 95),

                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Sign Up',
                          style: TextStyle(
                            color: darkColor,
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                            letterSpacing: -0.5,
                          ),
                        ),

                        Container(
                          width: 105,
                          height: 90,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius:
                                BorderRadius.circular(23),
                            boxShadow: [
                              BoxShadow(
                                color: primaryColor.withValues(
                                  alpha: 0.20,
                                ),
                                blurRadius: 12,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: IconButton(
                            onPressed: () {
                              FocusScope.of(context).unfocus();

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Sign Up button pressed',
                                  ),
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 72),

                    Center(
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        crossAxisAlignment:
                            WrapCrossAlignment.center,
                        children: [
                          Text(
                            'Already Have Account? ',
                            style: TextStyle(
                              color: greyColor,
                              fontSize: 15,
                            ),
                          ),

                          GestureDetector(
                            onTap: () {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Log In pressed',
                                  ),
                                ),
                              );
                            },
                            child: Text(
                              'Log In',
                              style: TextStyle(
                                color: primaryColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 85),
                  ],
                ),
              ),

              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLabel(String text) {
    return Text(
      text,
      style: TextStyle(
        color: greyColor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: greyColor,
          fontSize: 16,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 23,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Color(0xFFE4E4E4),
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: primaryColor,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}