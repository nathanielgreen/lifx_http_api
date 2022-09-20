import 'dart:io';
import 'package:lifx_http_api/lifx_http_api.dart';
import 'package:dart_console/dart_console.dart';

final console = Console();
final client = LifxHttpClient();

const prompt = '>>> ';


void main() {


  
  while (true) {
    console.write(prompt);
    final response = console.readLine(cancelOnBreak: true);
    if (response == null || response.isEmpty) {
      exit(0);
    } else {
      console.writeLine('YOU SAID: ${response.toUpperCase()}');
      console.writeLine();
    }
  }


}
