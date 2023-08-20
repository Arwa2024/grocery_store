import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:store/register_screen.dart';
import 'package:store/widgets/custom_text_field.dart';

import 'home_page.dart';

class SignScreen extends StatefulWidget {
  const SignScreen({super.key});

  @override
  State<SignScreen> createState() => _SignScreenState();
}

class _SignScreenState extends State<SignScreen> {
  bool visible = true;
  bool isLoading =true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffF4F5F9),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Stack(
                alignment: const Alignment(0, 0.9),
                children: [
                  const Stack(
                    children: [
                      Column(
                        children: [
                          Image(image: AssetImage("assets/images/login.png")),
                          SizedBox(
                            height: 220,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Form(
                    key: formKey,
                    child: SingleChildScrollView(
                      child: Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Color(0xffF4F5F9),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 15.0, top: 10),
                              child: Text(
                                'Welcome back !',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 15, top: 0),
                              child: Text(
                                'Sign in to your account',
                                style: TextStyle(
                                  color: Color(0xff868889),
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: CustomTextField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Email must not be empty';
                                      }
                                      return null;
                                    },
                                    controller: emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    secureText: false,
                                    hintText: 'Email',
                                    textFieldIcon: const Icon(
                                      Icons.email_outlined,
                                      size: 20,
                                      color: Color(0xff868889),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: CustomTextField(
                                    controller: passController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Password must not be empty';
                                      } else if (value.length < 6) {
                                        return 'Password is too short';
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.visiblePassword,
                                    secureText: visible,
                                    suffIcon: IconButton(
                                      icon: visible == true
                                          ? const Icon(
                                              Icons.visibility_outlined)
                                          : const Icon(
                                              Icons.visibility_off_outlined),
                                      iconSize: 20,
                                      color: const Color(0xff868889),
                                      onPressed: () {
                                        visible = !visible;
                                        setState(() {});
                                      },
                                    ),
                                    hintText: 'Password',
                                    textFieldIcon: const Icon(
                                      Icons.lock_outline_rounded,
                                      size: 20,
                                      color: Color(0xff868889),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Container(
                                    height: 60,
                                    width: 400,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        gradient: LinearGradient(colors: [
                                          Color(0xffAEDC81),
                                          Color(0xff6CC518)
                                        ]),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))),
                                    child: MaterialButton(
                                      onPressed: () async{
                                        if (formKey.currentState!.validate()) {

                                          Navigator.push(context, MaterialPageRoute(builder: (context){
                                            return HomePage();
                                          }));                                     }
                                        try{
                                          UserCredential user = await FirebaseAuth.instance.signInWithEmailAndPassword(
                                              email: emailController.text,
                                              password: passController.text);
                                          Navigator.push(context, MaterialPageRoute(builder: (context){
                                            return HomePage();
                                          }));
                                        }on FirebaseAuthException catch(e){
                                          if (e.code == 'weak-password') {
                                            ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(content: Text('The password provided is too weak.',
                                                    style: TextStyle(
                                                        color: Colors.white
                                                    ))));
                                          } else if (e.code == 'email-already-in-use') {
                                            ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(content: Text('The account already exists for that email.')));
                                          }
                                        }
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Login',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text('Don’t have an account ? '),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return const RegisterScreen();
                                        }));
                                      },
                                      child: const Text(
                                        'Sign up',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Padding(
                                padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
