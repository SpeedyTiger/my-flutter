import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

void main() { runApp(const MyApp((), key: UniqueKey(),)); }


class MyApp extends StatelessWidget {
  const MyApp(Type myApp, {required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SinginPage(key: UniqueKey()),
    );
  }
}

class SinginPage extends StatefulWidget {
  const SinginPage({required Key key}) : super(key: key);
  @override
  _SinginPageState createState() => _SinginPageState();
}

class _SinginPageState extends State<SinginPage> {
  bool obscureText = false;

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  final emailGlobalKey = GlobalKey<FormState>();
  final passwordGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var currentWidth = MediaQuery.of(context).size.width;
    var small = currentWidth > 1201;
    var extraSmall = currentWidth > 1025;

    var Validators;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: extraSmall ? MediaQuery.of(context).size.height : 0.0,
            width: small
                ? MediaQuery.of(context).size.width * 0.72
                : extraSmall
                ? MediaQuery.of(context).size.width - 500
                : 0.0,
            color: Colors.indigo[200],
            child: Image.network(
              'https://cdn.pixabay.com/photo/2021/10/11/13/12/website-6700615_960_720.png',
              fit: BoxFit.cover,
            ),
          ),
          Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: small ? MediaQuery.of(context).size.width * 0.28 : 500,
                alignment: Alignment.center,
                color: Colors.white,
                child: Container(
                  padding: const EdgeInsets.all(60.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 45.0),
                      Container(
                        alignment: Alignment.topLeft,
                        child: const Text(
                          'WELCOME BACK :)',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 65.0),
                      Container(
                        alignment: Alignment.topLeft,
                        child: const Text('Email'),
                      ),
                      Form(
                        key: emailGlobalKey,
                        child: TextFormField(
                          onChanged: (value) {
                            setState(() {
                              _email.text = value;
                            });
                          },
                          decoration: const InputDecoration(
                            prefixIcon: Padding(
                              padding:
                              EdgeInsets.only(right: 20.0, bottom: 1.0),
                              child: Icon(Icons.email_outlined,
                                  color: Colors.black45, size: 24.0),
                            ),
                            contentPadding: EdgeInsets.only(top: 15.0, left: 0),
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.grey),
                            hintText: 'Email',
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.indigo, width: 2.0),
                            ),
                          ),
                          validator: Validators.required('Email is required!'),
                        ),
                      ),
                      const SizedBox(height: 25.0),
                      Container(
                        alignment: Alignment.topLeft,
                        child: const Text('Password'),
                      ),
                      Form(
                        key: passwordGlobalKey,
                        child: TextFormField(
                          obscureText: obscureText,
                          onChanged: (value) {
                            setState(() {
                              _password.text = value;
                            });
                          },
                          decoration: InputDecoration(
                            suffixIcon: obscureText
                                ? InkWell(
                              onTap: () {
                                setState(() {
                                  obscureText = false;
                                });
                              },
                              child: const Icon(Ionicons.eye,
                                  color: Colors.black54, size: 25.0),
                            )
                                : InkWell(
                              onTap: () {
                                setState(() {
                                  obscureText = true;
                                });
                              },
                              child: const Icon(Ionicons.eye_off,
                                  color: Colors.black54, size: 25.0),
                            ),
                            prefixIcon: const Padding(
                              padding:
                              EdgeInsets.only(right: 20.0, bottom: 1.0),
                              child: Icon(Icons.lock_outline,
                                  color: Colors.black45, size: 25.0),
                            ),
                            contentPadding:
                            const EdgeInsets.only(top: 15.0, left: 0),
                            hintStyle: const TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.grey),
                            hintText: 'Password',
                            focusedBorder: const UnderlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.indigo, width: 2.0),
                            ),
                          ),
                          validator:
                          Validators.required('Password is required!'),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Container(
                          alignment: Alignment.topRight,
                          child: TextButton(
                            style: TextButton.styleFrom(
                                padding: const EdgeInsets.all(0.0)),
                            onPressed: () {},
                            child: const Text('Forgot Password'),
                          )),
                      const SizedBox(
                        height: 50.0,
                      ),
                      SizedBox(
                        height: 45.0,
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: _password.text != ''
                                  ? _password.text != ''
                                  ? Colors.indigo
                                  : Colors.indigo[300]
                                  : Colors.indigo[300],
                              elevation: 0.0,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0)),
                              padding: const EdgeInsets.only(
                                  left: 30.0,
                                  top: 0.0,
                                  right: 30.0,
                                  bottom: 0.0)),
                          onPressed: () {
                            emailGlobalKey.currentState?.validate();
                            passwordGlobalKey.currentState?.validate();
                          },
                          child: const Text('LOGIN',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 30.0),
                        child: const Text('OR'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Material(
                                color: Colors.indigo,
                                borderRadius: BorderRadius.circular(50.0),
                                child: const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Icon(
                                    Ionicons.logo_facebook,
                                    color: Colors.white,
                                    size: 30.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Padding(
                              padding:
                              const EdgeInsets.only(left: 8.0, right: 8.0),
                              child: Material(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(50.0),
                                  child: const Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Icon(
                                      Ionicons.logo_google,
                                      color: Colors.white,
                                      size: 30.0,
                                    ),
                                  )),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Material(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(50.0),
                                child: const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Icon(
                                    Ionicons.logo_twitter,
                                    color: Colors.white,
                                    size: 30.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: small ? 100.0 : 60.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("I don't have an account?"),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Sign up",
                              style: TextStyle(color: Colors.blue),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 30.0, right: 50),
                child: Icon(
                  Ionicons.settings_outline,
                  color: Colors.black12.withOpacity(0.03),
                  size: 80.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
