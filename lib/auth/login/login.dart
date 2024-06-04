import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:youapp/edit/edit_profile.dart';
import 'package:youapp/util/app_color.dart';
import 'package:youapp/widgets/background.dart';
import 'package:youapp/widgets/ptb_go_button.dart';
import 'package:youapp/widgets/you_app_loading_dialog.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  LoginWidgetState createState() => LoginWidgetState();
}

class LoginWidgetState extends State<LoginWidget> {
  final ScrollController _scrollController = ScrollController();
  final _formKey = GlobalKey<FormState>();
  final FocusNode _phoneFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _hidePwd = true;

  final LoadingDialogController _loginDialogController =
      LoadingDialogController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            controller: _scrollController,
            child: SizedBox(
              height: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top -
                  MediaQuery.of(context).padding.bottom,
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        _getForm(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _getLogo() {
    return Image.asset(
      'assets/images/ptbgo_black_logo.png',
      height: 40,
    );
  }

  Widget _getForm() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(26),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.only(left: 41.0),
              child: Text(
                'Login',
                style: TextStyle(
                  color: YouAppColor.whiteColor,
                  fontSize: 24,
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _phoneController,
              focusNode: _phoneFocus,
              cursorColor: YouAppColor.whiteColor,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.phone,
              style: const TextStyle(color: YouAppColor.whiteColor),
              decoration: _getInputDec(
                  _phoneFocus.hasFocus ? "" : "Enter Username/Email"),
              onFieldSubmitted: (_) =>
                  _fieldFocusChange(context, _phoneFocus, _passwordFocus),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _passwordController,
              focusNode: _passwordFocus,
              cursorColor: YouAppColor.whiteColor,
              keyboardType: TextInputType.visiblePassword,
              obscureText: _hidePwd,
              style: const TextStyle(color: YouAppColor.whiteColor),
              textInputAction: TextInputAction.done,
              decoration: _getInputDec(
                _passwordFocus.hasFocus ? "" : "Enter Password",
                suffixIcon: InkWell(
                  child: const Icon(Icons.password),
                  onTap: () => setState(() => _hidePwd = !_hidePwd),
                ),
              ),
              onFieldSubmitted: (_) => _passwordFocus.unfocus(),
            ),
            const SizedBox(height: 24),
            YouAppButton(
              child: const Text(
                "Login",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const EditProfile()));
                // showDialog(
                //   barrierDismissible: false,
                //   context: context,
                //   builder: (context) {
                //     return YouAppLoadingDialog(
                //         controller: _loginDialogController, onLoading: () {});
                //   },
                // );
              },
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: RichText(
                text: TextSpan(
                  text: 'No account? Register here',
                  recognizer: TapGestureRecognizer()..onTap = () => [],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  InputDecoration _getInputDec(String label, {Widget? suffixIcon}) {
    return InputDecoration(
      hintText: label,
      suffixIcon: suffixIcon,
      fillColor: const Color.fromRGBO(255, 255, 255, 0.06),
      hintStyle: TextStyle(color: YouAppColor.whiteColor.withOpacity(0.4)),
      border: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Color.fromRGBO(255, 255, 255, 0.06),
        ),
        borderRadius: BorderRadius.all(Radius.circular(9.0)),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Color.fromRGBO(255, 255, 255, 0.06),
        ),
        borderRadius: BorderRadius.all(Radius.circular(9.0)),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Color.fromRGBO(255, 255, 255, 0.06),
        ),
        borderRadius: BorderRadius.all(Radius.circular(9.0)),
      ),
    );
  }
}
