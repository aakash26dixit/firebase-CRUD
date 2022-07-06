import 'package:collegeapp/model/user_model.dart';
import 'package:collegeapp/pages/admin/add_company_page.dart';
import 'package:collegeapp/pages/admin/list_company_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:collegeapp/pages/content.dart';
import 'package:collegeapp/pages/user/register.dart';
import 'package:fluttertoast/fluttertoast.dart';

class adminLogin extends StatefulWidget {
  @override
  _adminLoginState createState() => _adminLoginState();
}

class _adminLoginState extends State<adminLogin> {

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
      validator: (value){
        if(value!.isEmpty){
          return("Please Enter your email");
        }

        if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
          return ("Please enter a valid email");
        }

        return null;
      },
      onSaved: (value){
        emailController.text = value!;
      },
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.email,
          color: Colors.red  
        ),
        hintText: "Username",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.green, width: 0.0),
        )
      ),

      textInputAction: TextInputAction.next,

    );

    final passwordField = TextFormField(

      autofocus: false,
      controller: passwordController,
      obscureText: true,

      validator: (value){
        RegExp regex = new RegExp(r'^,{6,}$');
        if(value!.isEmpty){
          return ("Password is required for login");
        }

        // if(!regex.hasMatch(value)){
        //   return("Please enter a valid passoword(min 6 character)");
        // }
         
      },

      onSaved: (value){
        passwordController.text = value!;
      },

      textInputAction: TextInputAction.done,

      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.password,
          color: Colors.red  
        ),
        hintText: "password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.green, width: 0.0),
        )
      ),
    );

    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed : () {
          signIn(emailController.text, passwordController.text);
        },
        child: Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20, 
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
        color: Colors.redAccent,
      ),
    );

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color:Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formkey, 
                child: Column(  
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height:200
                    ),
                    emailField,
                    SizedBox(
                      height:20
                    ),
                    passwordField,
                    SizedBox(
                      height:20
                    ),
                    loginButton,
                    SizedBox(
                      height:20
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Don't have an account"),
                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Register()
                            ));
                          },
                          child: Text("Signup",
                            style:TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15
                            )
                          )
                        )
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

  void signIn(String email, String password) async{
    if(_formkey.currentState!.validate()){
      await _auth.signInWithEmailAndPassword(email: email, password: password)
      .then((uid) => {
        Fluttertoast.showToast(msg: "Login Successful"),
        // Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddComPage()))
        // Navigator.of(context).push(MaterialPageRoute(builder: (context) => ListCompanyPage()))
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddComPage()))
        
      }).catchError((e) => {
        Fluttertoast.showToast(msg: e!.message)
      });
    }
  }
}
