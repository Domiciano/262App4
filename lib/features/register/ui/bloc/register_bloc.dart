// Eventos que recibo
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviles_auth/features/register/domain/signup_usecase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class RegisterEvent {}

class OnRegisterSubmittedEvent extends RegisterEvent {
  final String fullName;
  final String username;
  final String email;
  final String password;

  OnRegisterSubmittedEvent({
    required this.fullName,
    required this.username,
    required this.email,
    required this.password,
  });
}

// Estados que emito
abstract class RegisterState {}

class RegisterIdleState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterErrorState extends RegisterState {
  final String errorMessage;
  RegisterErrorState({required this.errorMessage});
}

class RegisterSuccessState extends RegisterState {}

// La clase Bloc

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  //Dependencia
  SignupUsecase usecase = SignupUsecase();

  RegisterBloc() : super(RegisterIdleState()) {
    on<OnRegisterSubmittedEvent>(register);
  }

  Future<void> register(
    OnRegisterSubmittedEvent event,
    Emitter<RegisterState> emit,
  ) async {
    try {
      emit(RegisterLoadingState());
      await usecase.call(
        event.email,
        event.password,
        event.username,
        event.fullName,
      );
      emit(RegisterSuccessState());
    } on Exception catch (e) {
      emit(RegisterErrorState(errorMessage: e.toString()));
    }
  }
}
