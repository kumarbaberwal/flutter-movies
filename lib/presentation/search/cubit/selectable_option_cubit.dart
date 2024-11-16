import 'package:flutter_bloc/flutter_bloc.dart';

enum SearchType { moive, tv }

class SelectableOptionCubit extends Cubit<SearchType> {
  SelectableOptionCubit() : super(SearchType.moive);

  void selectMovie() => emit(SearchType.moive);
  void selectTv() => emit(SearchType.tv);
}
