import 'dart:io';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class Failure extends Equatable {
  final String? responseMsg;

  const Failure(this.responseMsg);
  @override
  List<Object> get props => [];
  String? get apiMsg;
  String displayErrorMessage();
}

// General failures
class ServerFailure extends Failure {
  final String? message;
  const ServerFailure({this.message}) : super(message);
  @override
  displayErrorMessage() {
    return message ?? "An error Occurred,try again later";
  }

  @override
  String? get apiMsg => message;
}

class CacheFailure extends Failure {
  @override
  displayErrorMessage() {
    return "An error Occurred, try again Later";
  }

  final String? message;
  const CacheFailure({this.message}) : super(message);
  @override
  String? get apiMsg => message;
}

class InternetFailure extends Failure {
  final String? message;
  const InternetFailure({this.message}) : super(message);
  @override
  String? get apiMsg => message;
  @override
  displayErrorMessage() {
    return "You are Offline! please check your internet";
  }
}

//Unauthorized
class Unauthorized extends Failure {
  final String? message;
  const Unauthorized({this.message}) : super(message);
  @override
  String? get apiMsg => message;
  @override
  displayErrorMessage() {
    return "Invalid Passcode";
  }
}

class NotFoundFailure extends Failure {
  final String? message;
  const NotFoundFailure({this.message}) : super(message);
  @override
  String? get apiMsg => message;
  @override
  displayErrorMessage() {
    return "User ID not found. Please check and retry";
  }
}

class UserNotFoundFailure extends Failure {
  final String? message;
  const UserNotFoundFailure({this.message}) : super(message);
  @override
  String? get apiMsg => message;
  @override
  displayErrorMessage() {
    return "User ID not found. Please check and retry";
  }
}

class UserLockedFailure extends Failure {
  final String? message;
  const UserLockedFailure({this.message}) : super(message);
  @override
  String? get apiMsg => message;
  @override
  displayErrorMessage() {
    return "User locked, please contact the administrator";
  }
}

class TermsConditionsAlreadyAcceptedFailure extends Failure {
  final String? message;
  const TermsConditionsAlreadyAcceptedFailure({this.message}) : super(message);
  @override
  String? get apiMsg => message;
  @override
  displayErrorMessage() {
    return "Terms and conditions already accepted, please restart the application.";
  }
}

class EmailValidationFailure extends Failure {
  final String? message;
  const EmailValidationFailure({this.message}) : super(message);
  @override
  String? get apiMsg => message;

  @override
  displayErrorMessage() {
    return message ?? "Invalid Email!";
  }
}

class InvalidCurrentPassword extends Failure {
  final String? message;
  const InvalidCurrentPassword({this.message}) : super(message);
  @override
  String? get apiMsg => message;

  @override
  displayErrorMessage() {
    return message ?? "Invalid password supplied, check your current password!";
  }
}

class LargeImageFailure extends Failure {
  final String? message;
  const LargeImageFailure({this.message}) : super(message);
  @override
  String? get apiMsg => message;
  @override
  displayErrorMessage() {
    return "Image Size should be less than 5 MB";
  }
}

class LargeDocumentImageFailure extends Failure {
  final String? message;
  const LargeDocumentImageFailure({this.message}) : super(message);
  @override
  String? get apiMsg => message;
  @override
  displayErrorMessage() {
    return "Image/Doc Size should be less than 10 MB";
  }
}

class InternetConnectFailure extends Failure {
  final String? message;
  const InternetConnectFailure({this.message}) : super(message);
  @override
  String? get apiMsg => "You are disconnected from the internet.";
  @override
  displayErrorMessage() {
    return "You are disconnected from the internet.";
  }
}

class ServerConnectionCancelled extends Failure {
  final String? message;
  const ServerConnectionCancelled({this.message}) : super(message);
  @override
  @override
  String? get apiMsg => message;
  @override
  displayErrorMessage() {
    return "Connection cancelled";
  }
}

class ConnectionTimeout extends Failure {
  final String? message;

  const ConnectionTimeout({this.message}) : super(message);
  @override
  String? get apiMsg => message;
  @override
  displayErrorMessage() {
    return "Connecting timed out [10000ms]";
  }
}

class InvalidOTP extends Failure {
  final String? message;

  const InvalidOTP({this.message}) : super(message);
  @override
  String? get apiMsg => message;
  @override
  displayErrorMessage() {
    return "Invalid Code";
  }
}

class ResendCodeFailiure extends Failure {
  final String? message;

  const ResendCodeFailiure({this.message}) : super(message);
  @override
  String? get apiMsg => message;
  @override
  displayErrorMessage() {
    return "Failed, please try after 5 minute";
  }
}

class TokenExpired extends Failure {
  final String? message;

  const TokenExpired({this.message}) : super(message);
  @override
  String? get apiMsg => message;
  @override
  displayErrorMessage() {
    return "Token Expired";
  }
}

class OTPExpired extends Failure {
  final String? message;

  const OTPExpired({this.message}) : super(message);
  @override
  String? get apiMsg => message;
  @override
  displayErrorMessage() {
    return "You reached the maximum count of otp attempts. Please login again";
  }
}

class ServerStatus {
  final bool status;
  Failure? failure;

  ServerStatus({required this.status, required this.failure});
}

Future<bool> isInternetAvailable() async {
  final bool isConnected = await InternetConnectionChecker().hasConnection;
  if (isConnected) {
    return true;
  } else {
    throw const InternetConnectFailure();
  }
}

Future<ServerStatus> hanldeStatusCode(Response<dynamic> result) async {
  if (result.statusCode == 201 || result.statusCode == 200) {
    return ServerStatus(status: true, failure: null);
  } else {
    return ServerStatus(status: false, failure: const ServerFailure());
  }
}

handleThrownException(dynamic e) {
  if (e.toString().contains("SocketException")) {
    throw InternetConnectFailure(message: e.message);
  } else if (e is SocketException) {
    throw InternetConnectFailure(message: e.message);
  } else if (e.toString().contains("Connecting timed out [10000ms]")) {
    throw ConnectionTimeout(message: e.message);
  } else if (e.toString().contains("You are disconnected from the internet.")) {
    throw InternetConnectFailure(message: e.message);
  } else if (e is SocketException) {
    throw InternetConnectFailure(message: e.message);
  } else if (e is UserLockedFailure) {
    throw UserLockedFailure(message: e.message);
  } else if (e is LargeImageFailure) {
    throw LargeImageFailure(message: e.message);
  } else if (e is EmailValidationFailure) {
    throw EmailValidationFailure(message: e.message);
  } else if (e is UserNotFoundFailure) {
    throw UserNotFoundFailure(message: e.message);
  } else if (e is Unauthorized) {
    throw Unauthorized(message: e.message);
  } else if (e is TokenExpired) {
    throw TokenExpired(message: e.message);
  } else if (e is LargeDocumentImageFailure) {
    throw LargeDocumentImageFailure(message: e.message);
  } else if (e is InvalidOTP) {
    throw InvalidOTP(message: e.message);
  } else if (e is ResendCodeFailiure) {
    throw ResendCodeFailiure(message: e.message);
  } else if (e is OTPExpired) {
    throw OTPExpired(message: e.message);
  } else {
    throw const ServerFailure(
        message: "Something went wrong please try again later!");
  }
}
