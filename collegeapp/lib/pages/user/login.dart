import 'package:collegeapp/model/user_model.dart';
import 'package:collegeapp/pages/admin/login.dart';
import 'package:collegeapp/pages/admin/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:collegeapp/pages/content.dart';
import 'package:collegeapp/pages/user/register.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter your email");
        }

        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please enter a valid email");
        }

        return null;
      },
      onSaved: (value) {
        emailController.text = value!;
      },
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.email, color: Colors.red),
          hintText: "Username",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.green, width: 0.0),
          )),
      textInputAction: TextInputAction.next,
    );

    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,
      validator: (value) {
        RegExp regex = new RegExp(r'^,{6,}$');
        if (value!.isEmpty) {
          return ("Password is required for login");
        }

        // if(!regex.hasMatch(value)){
        //   return("Please enter a valid passoword(min 6 character)");
        // }
      },
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key, color: Colors.red),
          hintText: "password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.green, width: 0.0),
          )),
    );

    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          signIn(emailController.text, passwordController.text);
        },
        child: Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        color: Colors.redAccent,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("User Login"),
      ),
      endDrawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Login as Admin'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => adminLogin()
                  ));
              },
            ),
            ListTile(
              title: const Text('Sign in as Admin'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => adminRegister()
                  ));
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          SizedBox(height: 10),
                          Positioned(top: 20, child: animatedImage())
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    emailField,
                    SizedBox(height: 20),
                    passwordField,
                    SizedBox(height: 20),
                    loginButton,
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Don't have an account? "),
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Register()));
                            },
                            child: Text("Signup",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signIn(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                Fluttertoast.showToast(msg: "Login Successful"),
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Data()))
              })
          .catchError((e) => {Fluttertoast.showToast(msg: e!.message)});
    }
  }
}

class animatedImage extends StatefulWidget {
  const animatedImage({Key? key}) : super(key: key);

  @override
  _animatedImageState createState() => _animatedImageState();
}

class _animatedImageState extends State<animatedImage> with SingleTickerProviderStateMixin {
  
  late final AnimationController _controller = AnimationController(vsync: this, duration: const Duration(seconds: 3))
      ..repeat(reverse: true);

  late Animation<Offset> _animation = Tween(begin: Offset.zero, end: Offset(0, 0.1)).animate(_controller);

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Image.asset("assets/images/login.jpg"),
    );
  }
}
