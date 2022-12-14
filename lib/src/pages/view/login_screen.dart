import 'package:flutter/material.dart';

import 'package:movilidad/src/pages/view/home_screen.dart';

import '../../providers/db_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // form key
  final _formKey = GlobalKey<FormState>();

  // editing controller
  final TextEditingController userController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  //focus nodes
  FocusNode textSecondFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    //user field
    final usuarioField = TextFormField(
      autofocus: false,
      onFieldSubmitted: (value) {
        FocusScope.of(context).requestFocus(textSecondFocusNode);
      },
      controller: userController,
      validator: (value) {
        if (value!.isEmpty) {
          return ("El Usuario es requerido para ingresar");
        }
      },
      onSaved: (value) {
        userController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.person),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Usuario",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    //password field
    final passwordField = TextFormField(
      autofocus: false,
      focusNode: textSecondFocusNode,
      controller: passwordController,
      onFieldSubmitted: (value) {
        if (_formKey.currentState!.validate()) {
          signIn(userController.text, value);
        }
      },
      obscureText: true,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("La Contraseña es requerida para ingresar");
        }
        if (!regex.hasMatch(value)) {
          return ("Ingrese Contraseña valida(Min 6 Caracteres)");
        }
      },
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.vpn_key),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Contraseña",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    //Login Buttton
    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.purple,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          //cambia el focus de la pantalla
          FocusScope.of(context).unfocus();
          //valida si es correcto el campo de texto
          if (_formKey.currentState!.validate()) {
            signIn(userController.text, passwordController.text);
          }
        },
        child: const Text(
          "Entrar",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
    //View complete
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                //Valida automaticamente al escribir
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 200,
                      child: Image.asset(
                        "assets/logoMovilidad.jpeg",
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 45),
                    usuarioField,
                    const SizedBox(height: 25),
                    passwordField,
                    const SizedBox(height: 35),
                    loginButton,
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signIn(String username, String password) {
    clearTXT();
    //Base de datos Inicia
    //DBProvider.db.database;
    //Inicia la pantalla Home
    Navigator.pushNamed(context, 'home_screen');
  }

  void clearTXT() {
    userController.text = "";
    passwordController.text = "";
  }
}
