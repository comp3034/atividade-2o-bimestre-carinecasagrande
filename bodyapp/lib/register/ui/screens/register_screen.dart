import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  static GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Sign Up'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(228, 228, 228, 1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.account_circle_rounded,
                    size: 100,
                    color: Colors.teal,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, right: 20, left: 20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: TextFormField(
                            controller: name,
                            style:
                                TextStyle(fontSize: 22.0, color: Colors.black),
                            decoration: InputDecoration(
                              errorStyle: TextStyle(
                                fontSize: 16.0,
                              ),
                              hintText: 'Nome',
                              filled: true,
                              fillColor: Color.fromRGBO(228, 228, 228, 1),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide.none),
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(left: 15, right: 10),
                                child: Icon(
                                  Icons.person_outline,
                                  size: 40,
                                  color: Colors.teal,
                                ),
                              ),
                            ),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Insira seu nome';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: TextFormField(
                            controller: email,
                            style:
                                TextStyle(fontSize: 22.0, color: Colors.black),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide.none),
                              errorStyle: TextStyle(
                                fontSize: 16.0,
                              ),
                              hintText: 'Email',
                              filled: true,
                              fillColor: Color.fromRGBO(228, 228, 228, 1),
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(left: 15, right: 10),
                                child: Icon(
                                  Icons.email_outlined,
                                  size: 40,
                                  color: Colors.teal,
                                ),
                              ),
                            ),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Insira seu e-mail';
                              }

                              String p =
                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                              RegExp regExp = new RegExp(p);

                              if (!regExp.hasMatch(value)) {
                                return 'E-mail inválido';
                              }

                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: TextFormField(
                            controller: password,
                            style:
                                TextStyle(fontSize: 22.0, color: Colors.black),
                            obscureText: true,
                            decoration: InputDecoration(
                              errorStyle: TextStyle(
                                fontSize: 16.0,
                              ),
                              hintText: 'Senha',
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide.none),
                              fillColor: Color.fromRGBO(228, 228, 228, 1),
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(left: 15, right: 10),
                                child: Icon(
                                  Icons.lock_outline,
                                  size: 40,
                                  color: Colors.teal,
                                ),
                              ),
                            ),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Insira sua senha';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: TextFormField(
                            style:
                                TextStyle(fontSize: 22.0, color: Colors.black),
                            obscureText: true,
                            decoration: InputDecoration(
                              errorStyle: TextStyle(
                                fontSize: 16.0,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide.none),
                              hintText: 'Confirmar senha',
                              filled: true,
                              fillColor: Color.fromRGBO(228, 228, 228, 1),
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(left: 15, right: 10),
                                child: Icon(
                                  Icons.lock_outline,
                                  size: 40,
                                  color: Colors.teal,
                                ),
                              ),
                            ),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Insira a confirmação da senha';
                              }

                              if (password.text != value) {
                                return 'As senhas não conferem';
                              }

                              return null;
                            },
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              height: 60,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {}
                                },
                                child: Text(
                                  'Criar Conta',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                ),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.teal),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        side: BorderSide.none),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Divider(
                            height: 10,
                            thickness: 5,
                            indent: 20,
                            endIndent: 20,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/facebook.png',
                              width: 90,
                              height: 90,
                            ),
                            Image.asset(
                              'assets/images/twitter.png',
                              width: 90,
                              height: 90,
                            ),
                            Image.asset(
                              'assets/images/google.png',
                              width: 90,
                              height: 90,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
