import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_bbs/presenter/auth_presenter.dart';

class WelcomePage extends HookConsumerWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSignIn = useState(false);
    return Scaffold(
      appBar: AppBar(
        title: isSignIn.value ? const Text('Login') : const Text('Register'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
              ),
              isSignIn.value
                  ? const Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
              ElevatedButton(
                onPressed: () async {
                  ref.read(authPresenterProvider).signIn();
                },
                child: isSignIn.value
                    ? const Text('LogIn')
                    : const Text('Register'),
              ),
              OutlinedButton(
                child: isSignIn.value
                    ? const Text('Swich to Register')
                    : const Text('Swich to Login'),
                style: OutlinedButton.styleFrom(
                  primary: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  side: const BorderSide(),
                ),
                onPressed: () {
                  isSignIn.value = !isSignIn.value;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
