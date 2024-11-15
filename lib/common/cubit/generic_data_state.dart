abstract class GenericDataState {}

class GenericDataStateLoading extends GenericDataState {}

class GenericDataStateLoaded<T> extends GenericDataState {
  final T data;

  GenericDataStateLoaded({required this.data});
}

class GenericDataStateFailure extends GenericDataState {
  final String errorMessage;

  GenericDataStateFailure({required this.errorMessage});
}
