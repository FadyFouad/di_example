import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 07/06/2022 at 15:40.     ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

abstract class Failure extends Equatable {
  String get message;
  const Failure([List properties = const <dynamic>[]]);
}