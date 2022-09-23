// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:ferriapp/models/users.dart';
import 'package:ferriapp/page/login/components/input.dart';
import 'package:ferriapp/page/store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String login;
  String password;

  @override
  void initState() {
    super.initState();
  }

  onChangeUser(user) {
    setState(() {
      login = user;
    });
  }

  onChangePass(pass) {
    setState(() {
      password = pass;
    });
  }

  void redirec(String identification, String pass) {
    for (var user in users) {
      if (identification == user.cc && pass == user.password) {
        Navigator.of(context).pushNamed(Store.routeName);
      } else {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.builder(
            itemCount: 1,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height) *
                  1.1,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                color: Colors.white,
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          ClipRRect(
                              child: Image.asset(
                            'assets/logo.png',
                          )),
                          Form(
                            child: Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                height:
                                    MediaQuery.of(context).size.height * 0.38,
                                padding: const EdgeInsets.all(35),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color(0xff003566)
                                            .withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: const Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(50)),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Input(
                                            labelText: 'Usuario',
                                            iconMotion: Icons.person,
                                            onChange: onChangeUser,
                                            onHandlePass: false),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Input(
                                            labelText: 'Contraseña',
                                            iconMotion: Icons.vpn_key,
                                            suffixIcon: Icons.remove_red_eye,
                                            passwordVisible: true,
                                            onChange: onChangePass,
                                            onHandlePass: true),
                                      ],
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Container(
                                          alignment: Alignment.center,
                                          constraints: const BoxConstraints(
                                              minHeight: 36.0),
                                          decoration: const BoxDecoration(
                                              gradient: LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                                colors: [
                                                  Color(0xff001D3D),
                                                  Color(0xff003566),
                                                ],
                                              ),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(30.0))),
                                          child: InkWell(
                                              // min sizes for Material buttons
                                              onTap: () {
                                                setState(() {
                                                  if (login != null &&
                                                      password != null) {
                                                    redirec(login, password);
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                            const SnackBar(
                                                      content: Text(
                                                          "Ingrese los datos completos"),
                                                    ));
                                                  }
                                                });
                                              },
                                              child: const Text(
                                                'Iniciar Sesion',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              )),
                                        ),
                                      ],
                                    )
                                  ],
                                )),
                          ),
                          Container(
                            child: Column(
                              children: const [
                                Text(
                                  'LA FERRETERIA EN BOGOTA',
                                  style: TextStyle(
                                      fontSize: 19.9,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Montserrat',
                                      color: Color(0xff001D3D)),
                                ),
                                Text(
                                  'MAS COMPLETA DEL PAIS',
                                  style: TextStyle(
                                      fontSize: 19.9,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Montserrat',
                                      color: Color(0xffFFC300)),
                                  textAlign: TextAlign.end,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }));
  }
}
