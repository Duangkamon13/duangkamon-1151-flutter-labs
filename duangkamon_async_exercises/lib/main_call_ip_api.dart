/*
  Console API Call with JSON Parsing

  This program demonstrates the fundamentals of asynchronous programming in Dart.
  It performs an HTTP GET request to a public API, parses the JSON response,
  and extracts specific data to display in the console.

  Concepts used:
  - Asynchronous Programming: Using `async` and `await` to handle network latency.
  - HTTP Requests: Using the `http` package to send GET requests.
  - JSON Parsing: Using `dart:convert` (jsonDecode) to transform a JSON string into a Dart Map.
  --------------------------------------------------
  AI Documentation
  AI Tool: Gemini Pro
  Prompt 1:
  "How do I use data['key'] to access specific values from the parsed JSON?"

  Analysis and Application:
  - The AI explained that `jsonDecode` converts the JSON string into a Dart Map.
  - To access a specific value, we use square brackets `[]` with the key name as a string.
  - In this case, `dataJson['ip']` is used to retrieve the IP address string from the map.

  --------------------------------------------------
  @author Duangkamon Chaithongsri
  @version 1.0.0
  @date 2026-02-12
*/
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  await fetchIPAddress();
}

Future<void> fetchIPAddress() async {
  //Code from Lab document
  try {
    final response = await http.get(
      Uri.parse('https://api.ipify.org?format=json'),
    );
    //Code from slide(page 38)
    if (response.statusCode == 200) {
      final dataJson = jsonDecode(response.body);
      print('Your public IP address is: ${dataJson['ip']}');
    } else {
      print('Failed to fetch IP address. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
}


