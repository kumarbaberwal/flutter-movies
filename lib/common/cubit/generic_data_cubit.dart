import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/common/cubit/generic_data_state.dart';
import 'package:movies/core/usecase/use_case.dart';

class GenericDataCubit extends Cubit<GenericDataState> {
  GenericDataCubit() : super(GenericDataStateLoading());

  void getData<T>(UseCase usecase, {dynamic params}) async {
    var returnedData = await usecase.call();

    returnedData.fold((error) {
      emit(GenericDataStateFailure(errorMessage: error));
    }, (data) {
      emit(GenericDataStateLoaded<T>(data: data));
    });
  }
}
