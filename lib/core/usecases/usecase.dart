import 'package:dartz/dartz.dart';
import 'package:di_example/core/error/failure.dart';
import 'package:flutter/material.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 07/07/2022 at 13:19.     ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
