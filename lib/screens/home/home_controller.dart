import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeController extends StatefulWidget {
  const HomeController({super.key});
  @override
  State<HomeController> createState() => _HomeControllerState();
}
class _HomeControllerState extends State<HomeController> {
  String _apiStatus = 'Press the button to check API connection';

  Future<void> _checkApi() async {
    setState(() {
      _apiStatus = 'Checking API...';
    });
    try {
      final response =
          await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
      if (response.statusCode == 200) {
        setState(() {
          _apiStatus = 'Success: ${response.body}';
        });
      } else {
        setState(() {
          _apiStatus = 'Error: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        _apiStatus = 'Exception: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: _checkApi,
                child: const Text('Check API'),
              ),
              const SizedBox(height: 20),
              Text(
                _apiStatus,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}