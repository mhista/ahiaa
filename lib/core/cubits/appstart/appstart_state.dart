part of 'appstart_cubit.dart';

abstract class AppStartState extends Equatable {
  const AppStartState();

  @override
  List<Object> get props => [];
}

class AppStartInitial extends AppStartState {}

class AppStartNavigate extends AppStartState {
  final String route;
  const AppStartNavigate(this.route);

  @override
  List<Object> get props => [route];
}
