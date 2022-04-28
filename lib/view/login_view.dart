import 'package:auth/extensions/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogInView extends StatefulWidget {
  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = true;
  var password = '';
  var email = '';
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          toolbarHeight: 120.h,
          centerTitle: true,
          title: const Text(
            'Log In',
            style: TextStyle(fontSize: 30),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.blueAccent,
                Colors.cyan,
                // Colors.blue,
              ],
            )),
          ),
        ),
        backgroundColor: Colors.white,
        body: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.all(20.r),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 30.h,
                    ),
                    TextFormField(
                      validator: ((value) => value!.isValidEmail()),
                      onSaved: (value) => email = value!,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          icon: const Icon(Icons.email_rounded),
                          border: const UnderlineInputBorder(),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          focusColor: Theme.of(context).primaryColor,
                          labelText: "Email",
                          hintText: 'username@example.com',
                          errorBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)),
                          focusedErrorBorder: const UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 2.5))),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    TextFormField(
                      validator: (value) => value!.isValidPassword(),
                      onSaved: (value) => password = value!,
                      obscureText: _showPassword,
                      obscuringCharacter: '*',
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _showPassword = !_showPassword;
                                });
                              },
                              icon: _showPassword
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility)),
                          icon: const Icon(Icons.key_rounded),
                          border: const UnderlineInputBorder(),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          focusColor: Theme.of(context).primaryColor,
                          labelText: "Password",
                          hintText: '**********',
                          errorBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)),
                          focusedErrorBorder: const UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 2.5))),
                    ),
                    SizedBox(height: 60.h),
                    InkWell(
                      // splashColor: Colors.green,
                      onTap: () {
                        final _isValid = _formKey.currentState?.validate();
                        // GetSnackBar()
                        if (_isValid!) {
                          _formKey.currentState!.save();
                        }
                      },
                      child: Container(
                        height: 60.r,
                        width: 300.r,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            gradient: const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Colors.blueAccent,
                                Colors.cyan,
                                // Colors.blue,
                              ],
                            )),
                        child: const Text(
                          "Submit",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
      );
}
