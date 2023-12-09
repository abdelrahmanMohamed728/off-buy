import 'package:equatable/equatable.dart';

import 'base_model.dart';


abstract class OffBuyState extends Equatable {
  const OffBuyState();

  @override
  List<Object?> get props => [];
}

class OffBuyInitial extends OffBuyState {}

class OffBuyLoading extends OffBuyState {}

class OffBuyLoaded extends OffBuyState {
  final dynamic offBuyModel;
  const OffBuyLoaded(this.offBuyModel);
}

class OffBuyError extends OffBuyState {
  final String? message;
  const OffBuyError(this.message);
}

