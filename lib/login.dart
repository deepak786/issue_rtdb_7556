import 'package:flutter/material.dart';
import 'package:flutter_auth_ui/flutter_auth_ui.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: const Text("Login"),
              onPressed: () async {
                final providers = [
                  AuthUiProvider.email,
                ];

                final result = await FlutterAuthUi.startUi(
                  items: providers,
                  tosAndPrivacyPolicy: TosAndPrivacyPolicy(
                    tosUrl: "https://www.google.com",
                    privacyPolicyUrl: "https://www.google.com",
                  ),
                  androidOption: const AndroidOption(
                    enableSmartLock: false, // default true
                    showLogo: true, // default false
                    overrideTheme: true, // default false
                  ),
                  emailAuthOption: const EmailAuthOption(
                    requireDisplayName: false,
                    // default true
                    enableMailLink: false,
                    // default false
                    handleURL: '',
                    androidPackageName: '',
                    androidMinimumVersion: '',
                  ),
                );
                print(result);
              },
            ),
          ],
        ),
      ),
    );
  }
}
