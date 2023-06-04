// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const String baseURL = "http://127.0.0.1:8000/api/laporan/"; //emulator localhost
const Map<String, String> headers = {
  "Access-Control-Allow-Origin": "*",
  "Content-Type": "application/json",
  'Accept': '*/*'};
errorSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.red,
    content: Text(text),
    duration: const Duration(seconds: 1),
  ));
}
