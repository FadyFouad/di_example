import 'package:equatable/equatable.dart';

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

class ServerFailure extends Failure {
  const ServerFailure(String message);

  @override
  // TODO: implement message
  String get message => throw UnimplementedError();

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class CacheFailure extends Failure {
  const CacheFailure(String message);

  @override
  // TODO: implement message
  String get message => throw UnimplementedError();

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}