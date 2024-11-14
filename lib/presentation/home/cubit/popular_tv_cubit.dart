import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/domain/tv/usecases/get_popular_tv_use_case.dart';
import 'package:movies/presentation/home/cubit/popular_tv_state.dart';
import 'package:movies/service_locator.dart';

class PopularTvCubit extends Cubit<PopularTvState> {
  PopularTvCubit() : super(PopularTvStateLoading());

  void getPopularTv() async {
    var returedData = await sl<GetPopularTvUseCase>().call();
    returedData.fold((error) {
      emit(PopularTvStateFailure(errorMessage: error));
    }, (data) {
      emit(PopularTvStateLoaded(tv: data));
    });
  }
}
