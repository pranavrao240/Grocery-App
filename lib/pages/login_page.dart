import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/api/api_service.dart';
import 'package:grocery_app/config.dart';
import 'package:grocery_app/pages/register_page.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  bool isAsyncCallProcess = false;

  String? password;
  String? cnfPassword;
  String? email;
  bool hidePassword = true;
  bool hidePassword2 = true;
  bool hideCnfPassword = true;
  String textPwd = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ModalProgressHUD(
          inAsyncCall: isAsyncCallProcess,
          opacity: .3,
          key: UniqueKey(),
          child: Form(key: globalKey, child: _registerUI(context)),
        ),
      ),
    );
  }

  Widget _registerUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 150,
              ),
              Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "lib/assets/images/shopping_cart.jpg",
                    fit: BoxFit.contain,
                    width: 150,
                  )),
              SizedBox(
                height: 10,
              ),
              Text(
                "Grocery App",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
          Center(
            child: Text(
              "Login ",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.deepOrangeAccent),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          FormHelper.inputFieldWidget(
            context,
            "email",
            "E-mail",
            (onValidate) {
              if (onValidate.isEmpty) {
                return "* required";
              }
              bool emailValid =
                  RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                      .hasMatch(onValidate);

              if (!emailValid) {
                return "Invalid E-mail";
              }

              return null;
            },
            (onSaved) {
              email = onSaved.toString().trim();
            },
            showPrefixIcon: true,
            prefixIcon: Icon(Icons.email_outlined),
            borderRadius: 10,
            contentPadding: 15,
            fontSize: 14,
            prefixIconPaddingLeft: 10,
            borderColor: Colors.grey.shade400,
            textColor: Colors.black,
            prefixIconColor: Colors.black,
            hintColor: Colors.black.withOpacity(.6),
            backgroundColor: Colors.grey.shade100,
            borderFocusColor: Colors.grey.shade200,
          ),
          const SizedBox(
            height: 10,
          ),
          FormHelper.inputFieldWidget(
              context,
              "password",
              "Password",
              (onValidate) {
                if (onValidate.isEmpty) {
                  return "* required";
                }
              },
              (onSaved) {
                password = onSaved.toString();
              },
              showPrefixIcon: true,
              prefixIcon: Icon(Icons.password),
              borderRadius: 10,
              contentPadding: 15,
              fontSize: 14,
              prefixIconPaddingLeft: 10,
              borderColor: Colors.grey.shade400,
              textColor: Colors.black,
              prefixIconColor: Colors.black,
              hintColor: Colors.black.withOpacity(.6),
              backgroundColor: Colors.grey.shade100,
              borderFocusColor: Colors.grey.shade200,
              obscureText: hidePassword2,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    hidePassword2 = !hidePassword2;
                  });
                },
                color: Colors.red.withOpacity(.4),
                icon: Icon(
                    hidePassword2 ? Icons.visibility_off : Icons.visibility),
              ),
              onChange: (val) {
                password = val;
              }),
          SizedBox(height: 10),
          const SizedBox(
            height: 10,
          ),
          Center(
              child: FormHelper.submitButton("LogIn", () {
            if (validateSave()) {
              //API integration
              setState(() {
                isAsyncCallProcess = true;
              });
              ApiService.loginUser(context, email!, password!).then((res) {
                setState(() {
                  isAsyncCallProcess = false;
                });

                print("API Response: $res"); // Debugging line

                if (res) {
                  FormHelper.showSimpleAlertDialog(
                      context, Config.appName, "Logged IN Successfully", "OK",
                      () {
                    Navigator.of(context).pop();
                    Navigator.pushNamedAndRemoveUntil(
                        context, "/home", (routes) => false);
                  });
                } else {
                  FormHelper.showSimpleAlertDialog(
                      context, Config.appName, "Invalid email/password", "OK",
                      () {
                    Navigator.of(context).pop();
                  });
                }
              });
              // ApiService.loginUserDetails(email!, password!).then((res2) {
              //   print("API Response login Detail: $res2"); // Debugging line)
              // });
            } else {
              FormHelper.showSimpleAlertDialog(
                  context, Config.appName, "Please fill all the fields", "OK",
                  () {
                Navigator.of(context).pop();
              });
            }
          },
                  btnColor: Colors.deepOrange,
                  borderColor: Colors.white,
                  txtColor: Colors.white,
                  borderRadius: 20)),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: RichText(
                text: TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 14),
                    children: <TextSpan>[
                  TextSpan(text: "Do Not Have an Account?"),
                  TextSpan(
                      text: "Sign Up",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print("Tap on signup");
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterPage()));
                        },
                      style: TextStyle(
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold)),
                ])),
          )
        ],
      ),
    );
  }

  bool validateSave() {
    final form = globalKey.currentState;
    if (form == null) {
      print('FormState is null');
      return false;
    }

    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }
}
