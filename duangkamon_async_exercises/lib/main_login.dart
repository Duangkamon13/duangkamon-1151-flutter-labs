/*
  Login System with SharedPreferencesWithCache

  This program demonstrates how to use the synchronous SharedPreferences API
  in Flutter to persist user data. It saves username and password to local storage
  and retrieves them automatically upon app restart.

  Concepts used:
  - Local Storage: Using `SharedPreferencesWithCache` for synchronous read/write.
  - State Management: Using `TextEditingController` to manage input fields.
  - Security/Optimization: Using `allowList` to restrict storage to specific keys.
  - Debugging: Formatting console logs to track data flow (Loaded/Saved).
  --------------------------------------------------
  AI Documentation
  AI Tool: Gemini Pro

  Prompt 1:
  "The allowList is set to {'saveUsername', 'savePassword'}, but why is the data not being saved?"
  Analysis and Application:
  - The AI identified a mismatch between the keys used in the code (e.g., 'username')
    and the keys defined in the `allowList`.
  - The solution was to update all `getString` and `setString` calls to use
    'saveUsername' and 'savePassword' to strictly match the allowList.

  Prompt 2:
  "Why does the application freeze and crash immediately after pressing the Login button?"
  Analysis and Application:
  - The AI detected an infinite recursion error (Stack Overflow) because the
    `_saveUsernameAndPassword` function was calling itself inside `setState`.
  - The solution was to remove the recursive call and the unnecessary `setState`,
    ensuring the function executes only once per button press.


  @author Duangkamon Chaithongsri
  @version 1.0.0
  @date 2026-02-19
*/

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferencesWithCache.create(
    cacheOptions: const SharedPreferencesWithCacheOptions(
      allowList: {'saveUsername', 'savePassword'},
    ),
  );
  runApp(MyApp(prefs: prefs));
}

class MyApp extends StatelessWidget {
  final SharedPreferencesWithCache prefs;
  const MyApp({super.key, required this.prefs});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(prefs: prefs),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final SharedPreferencesWithCache prefs;
  const MyHomePage({super.key, required this.prefs});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _usernameController.text = widget.prefs.getString('saveUsername') ?? '';
    _passwordController.text = widget.prefs.getString('savePassword') ?? '';
    print('Loaded -> username: ${_usernameController.text}, password: ${_passwordController.text}');
  }

  void _saveUsernameAndPassword() {
    widget.prefs.setString('saveUsername', _usernameController.text);
    widget.prefs.setString('savePassword', _passwordController.text);
    print(
      'saved -> username: ${widget.prefs.getString('saveUsername')}, password: ${widget.prefs.getString('savePassword')}',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Using Shared Preferences With Cache')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _saveUsernameAndPassword,
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
