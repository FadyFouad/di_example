import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 07/09/2022 at 15:18.     ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/
abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker _connectivity;
  NetworkInfoImpl(this._connectivity);
  @override
  Future<bool> get isConnected => _connectivity.hasConnection;
}