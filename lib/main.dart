import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_bbs/app.dart';
import 'package:flutter_bbs/model/instance/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    ),
  );

  final pref = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        /// provide SharedPreferences in a synchronous process
        sharedPreferenceProvider.overrideWithValue(pref),
      ],
      child: const App(),
    ),
  );
}
