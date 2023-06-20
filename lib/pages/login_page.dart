import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  var isIndicatorVisible = false;

  bool switchValue = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: KeyboardVisibilityBuilder(
          builder: (BuildContext context, bool keyboardVisibility) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 1 / 9 * height),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 1 / 30 * width),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ClassDash',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 1 / 16 * height,
                              color: Colors.red,
                              fontFamily: 'DM Sans',
                            ),
                          ),
                          Text(
                            'Login To HAC',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 1 / 25 * height,
                              color: const Color.fromARGB(255, 94, 94, 94),
                              fontFamily: 'DM Sans',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Theme.of(context).scaffoldBackgroundColor == Colors.black
                        ? Image.asset(
                            'assets/ClassDashDark.png',
                            height: 55 / 422 * height,
                            width: 1 / 4 * width,
                          )
                        : Image.asset(
                            'assets/ClassDashMini.png',
                            height: 55 / 422 * height,
                            width: 1 / 4 * width,
                          ),
                  ],
                ),
              ),
              SizedBox(height: 1 / 25 * height),
              Card(
                elevation: 0.0,
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Container(
                  width: .91 * width,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(18)),
                    border: Border.all(width: 1, color: Colors.grey),
                    color: Theme.of(context).scaffoldBackgroundColor,
                    boxShadow: const [
                      BoxShadow(
                        spreadRadius: 0.5,
                        blurRadius: 0.5,
                        color: Color.fromARGB(255, 94, 94, 94),
                      )
                    ],
                  ),
                  child: TextField(
                    controller: _usernameController,
                    style: TextStyle(
                        color: Theme.of(context).scaffoldBackgroundColor ==
                                Colors.black
                            ? Colors.white
                            : Colors.black,
                        fontSize: 1 / 35 * height),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 1 / 30 * width),
                      hintText: 'Username',
                      hintStyle: TextStyle(
                        color: const Color.fromARGB(255, 118, 118, 118),
                        fontSize: 1 / 35 * height,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 1 / 50 * height),
              Card(
                color: Theme.of(context).scaffoldBackgroundColor,
                elevation: 0.0,
                child: Container(
                  width: .91 * width,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(18)),
                    color: Theme.of(context).scaffoldBackgroundColor,
                    border: Border.all(width: 1, color: Colors.grey),
                    boxShadow: const [
                      BoxShadow(
                        spreadRadius: 0.5,
                        blurRadius: 0.5,
                        color: Color.fromARGB(255, 94, 94, 94),
                      )
                    ],
                  ),
                  child: TextField(
                    style: TextStyle(
                      color: Theme.of(context).scaffoldBackgroundColor ==
                              Colors.black
                          ? Colors.white
                          : Colors.black,
                      fontSize: 1 / 35 * height,
                    ),
                    controller: _passwordController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 1 / 30 * width),
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        fontSize: 1 / 35 * height,
                        color: const Color.fromARGB(255, 118, 118, 118),
                      ),
                    ),
                    obscureText: true,
                    textInputAction: TextInputAction.done,
                    onEditingComplete: () {
                      FocusScope.of(context).unfocus();
                    },
                  ),
                ),
              ),
              SizedBox(height: 1 / 50 * height),
              keyboardVisibility
                  ? SizedBox(height: 3 / 6 * height)
                  : SizedBox(height: 1.8 / 6 * height),
              CustomLoginButton(width: width, height: height),
            ],
          ),
        );
      }),
    );
  }
}

class CustomLoginButton extends StatefulWidget {
  const CustomLoginButton({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  State<CustomLoginButton> createState() => _CustomLoginButtonState();
}

class _CustomLoginButtonState extends State<CustomLoginButton> {
  bool _isButtonPressed = false;
  bool _isIndicatorVisible = false;
  double _opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTapDown: (details) {
        setState(() {
          _isButtonPressed = true;
          _opacity = 0.5;
        });
      },
      onTapUp: (details) {
        setState(() {
          _isButtonPressed = false;
          _isIndicatorVisible = true;
          _opacity = 1.0;
        });

        FocusScope.of(context).unfocus();

        if (_isIndicatorVisible) {
          Future.delayed(const Duration(seconds: 5), () {
            Navigator.pushReplacementNamed(context, '/home_screen');
          });
        }
      },
      onTapCancel: () {
        setState(() {
          _isButtonPressed = false;
          _isIndicatorVisible = false;
          _opacity = 1.0;
        });
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Visibility(
            visible: !_isIndicatorVisible,
            child: AnimatedOpacity(
              opacity: _opacity,
              duration: const Duration(milliseconds: 150),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(9)),
                  color: Colors.red,
                ),
                width: 4 / 5 * widget.width,
                height: 1 / 16 * widget.height,
                child: Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w600,
                      fontSize: 1 / 28 * height,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: _isIndicatorVisible,
            child: SizedBox(
              width: 45,
              height: 45,
              child: CircularProgressIndicator(
                strokeWidth: 6.0,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
