import 'package:flutter/material.dart';
import 'package:i_dent_client/core/index.dart';
import 'package:i_dent_client/features/auth/index.dart';
import 'package:i_dent_client/features/auth/presentation/widgets/sign_in_form.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late bool isSignInSelected;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    isSignInSelected = true;
    emailFocusNode.addListener(() => setState(() {}));
    passwordFocusNode.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    emailController.dispose();
    emailFocusNode.dispose();
    passwordController.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double hPadding =
        MediaQuery.of(context).size.width * 0.05; // 5% each side = 90% content

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(gradient: AppColors.gradientNavy),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: hPadding),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment:
                    CrossAxisAlignment.stretch, // children fill the 90%
                children: [
                  Image.asset(
                    'assets/images/Ident logo.png',
                    width: 100,
                    height: 100,
                  ),
                  Column(
                    children: [
                      Text("i-Dent",
                          style: AppFontStyles.display
                              .copyWith(color: Colors.white, fontSize: 30)),
                      Text("AI-Powered Dental Manager",
                          style:
                              AppFontStyles.body.copyWith(color: Colors.white)),
                    ],
                  ),
                  const SizedBox(height: 25,),
                  FormSwitchButtons(
                    isActive: isSignInSelected,
                    onTapSignIn: () => setState(() => isSignInSelected = true),
                    onTapSignUp: () => setState(() => isSignInSelected = false),
                  ),
                  const SizedBox(height: 25,),
                  SignInForm(
                    formKey: _formKey,
                    emailController: emailController,
                    passwordController: passwordController,
                    emailFocusNode: emailFocusNode,
                    passwordFocusNode: passwordFocusNode,
                  ),
                  const SizedBox(height: 15,),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      child: Text("Forget password?",
                          style: AppFontStyles.label
                              .copyWith(color: Colors.white.withOpacity(0.5))),
                    ),
                  ),
                  const SizedBox(height: 15,),
                  SubmitSignInButton(label: "Sign In", onPressed: () {}),
                  const SizedBox(height: 15,),
                  HorizontalDivider(),
                  const SizedBox(height: 15,),
                  OAuthButtons(),
                  const SizedBox(height: 15,),
                  TermsAndConditions(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
