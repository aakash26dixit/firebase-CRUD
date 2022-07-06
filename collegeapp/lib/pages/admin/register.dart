import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collegeapp/model/admin_model.dart';
import 'package:collegeapp/pages/content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:collegeapp/model/admin_model.dart';


class adminRegister extends StatefulWidget {
  @override
  _adminRegisterState createState() => _adminRegisterState();
}


class _adminRegisterState extends State<adminRegister> {

  final _auth = FirebaseAuth.instance;

  final _formkey = GlobalKey<FormState>();

  final  firstNameEditingController = new TextEditingController();
  final  secondNameEditingController = new TextEditingController();
  final  emailEditingController = new TextEditingController();
  final  passwordEditingController = new TextEditingController();
  final  confirmPasswordEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
   
    final firstNameField = TextFormField(

      autofocus: false,
      controller: firstNameEditingController,
      keyboardType: TextInputType.emailAddress,

      onSaved: (value){
        firstNameEditingController.text = value!;
      },
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.account_circle,
          color: Colors.red,  
        ),
        hintText: "FirstName",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.green, width: 0.0),
        )
      ),

      textInputAction: TextInputAction.next,

    );

    final secondNameField = TextFormField(

      autofocus: false,
      controller: secondNameEditingController,
      obscureText: true,

      onSaved: (value){
        secondNameEditingController.text = value!;
      },

      textInputAction: TextInputAction.done,

      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.account_circle,
          color: Colors.red,      
        ),
        hintText: "Second Name",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.green, width: 0.0),
        )
      ),
    );

    final emailField = TextFormField(

      autofocus: false,
      controller: emailEditingController,
      obscureText: true,

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
        emailEditingController.text = value!;
      },

      textInputAction: TextInputAction.done,

      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.email,
          color: Colors.red,  
        ),
        hintText: "Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.green, width: 0.0),
        )
      ),
    );

    final passwordField = TextFormField(

      autofocus: false,
      controller: passwordEditingController,
      obscureText: true,

      onSaved: (value){
        passwordEditingController.text = value!;
      },

      textInputAction: TextInputAction.done,

      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.vpn_key,
          color: Colors.red,    
        ),
        hintText: "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.green, width: 0.0),
        )
      ),
    );

    final confirmPasswordField = TextFormField(

      autofocus: false,
      controller: confirmPasswordEditingController,
      obscureText: true,
      validator: (value){
        if(confirmPasswordEditingController.text != passwordEditingController.text){
          return("Passwords dont match");
        }
        return null;
      },
      onSaved: (value){
        confirmPasswordEditingController.text = value!;
      },

      textInputAction: TextInputAction.done,

      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.vpn_key,
          color: Colors.red,    
        ),
        hintText: "Confirm Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.green, width: 0.0),
        )
      ),
    );


    final RegisterButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed : () {
          signup(emailEditingController.text, passwordEditingController.text);
        },
        child: Text(
          "Register",
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
                    firstNameField,
                    SizedBox(
                      height:20
                    ),
                    secondNameField,
                    SizedBox(
                      height:20
                    ),
                    emailField,
                    SizedBox(
                      height:20
                    ),
                    passwordField,
                    SizedBox(
                      height:20
                    ),
                    confirmPasswordField,
                    SizedBox(
                      height:20
                    ),
                    RegisterButton,
                    SizedBox(
                      height:20
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Already have an account?"),
                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => adminRegister()
                            ));
                          },
                          child: Text("Login",
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

  void signup(String email, String password) async{
    if(_formkey.currentState!.validate()){
      await _auth.createUserWithEmailAndPassword(email: email, password: password)
      .then((value) => {
        postDetailsToFireStore()
      })
      .catchError((e) => {
        Fluttertoast.showToast(msg: e.message)
      });
    }
  }

  postDetailsToFireStore() async{
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? admin = _auth.currentUser;

    AdminModel adminModel = AdminModel();

    adminModel.email = admin!.email;
    adminModel.uid = admin.uid;
    adminModel.firstName = firstNameEditingController.text;
    adminModel.secondName = secondNameEditingController.text;

    await firebaseFirestore.collection("admin").doc(admin.uid).set(adminModel.toMap());

    Fluttertoast.showToast(msg: "Account created successfully");

    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => Data()
    ));
  }
}