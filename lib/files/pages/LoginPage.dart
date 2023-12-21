// ignore_for_file: library_private_types_in_public_api, file_names
import 'package:doll_store/files/widget/bottomnavigationbar.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _errormessage = '';

  bool _authenticateUser(String username, String password) {
    return (username == 'sg' && password == '88');
  }

//login handle
  void _handleLogin() {
    final String username = _usernameController.text;
    final String password = _passwordController.text;

    if (_authenticateUser(username, password)) {
      // Navigate to Store page with bot nav button
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => (const Store_botnav())),
      );
    } else {
      setState(() {
        _errormessage = 'Invalid username or password';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30)),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: TextFormField(
                          controller: _usernameController,
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              border: OutlineInputBorder(),
                              hintText: "Enter Username",
                              labelText: "Username"),
                          onChanged: (String? value) {}, //onchanged
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your username';
                            }
                            return null;
                          }, //validator
                        ),
                      ),
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          controller: _passwordController,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.lock),
                              border: OutlineInputBorder(),
                              hintText: "Enter password",
                              labelText: "Password"),
                          obscureText: true,
                          onChanged: (String? value) {},
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          }, //validator
                        ),
                      ),
                      Text(
                        _errormessage,
                        style: const TextStyle(color: Colors.red),
                      ),
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: MaterialButton(
                          onPressed: _handleLogin,
                          color: Colors.lightBlue,
                          textColor: Colors.white,
                          child: const Text("Login"),
                        ),
                      ),
                    ],
                  )),
            )
          ], //children
        ),
      ),
    );
  }
}
