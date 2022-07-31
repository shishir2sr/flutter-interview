import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String error;
  final String type;
  const Failure({
    required this.error,
    required this.type,
  });

  factory Failure.none() => const Failure(error: '', type: '');

  @override
  List<Object> get props => [error, type];

  @override
  String toString() => 'Failure(error: $error, type: $type)';
}
