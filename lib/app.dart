import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_bbs/presenter/auth_presenter.dart';
import 'package:flutter_bbs/view/home.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter_bbs/view/welcome.dart';

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final presenter = ref.watch(authPresenterProvider);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: FlexColorScheme.light(
        scheme: FlexScheme.indigo,
        appBarElevation: 4,
      ).toTheme,
      darkTheme: FlexColorScheme.dark(
        scheme: FlexScheme.indigo,
        appBarElevation: 4,
      ).toTheme,
      home: presenter.isAuth ? const HomePage() : const WelcomePage(),
    );
  }
}
