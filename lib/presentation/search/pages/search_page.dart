import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/common/widgets/appbar/app_bar.dart';
import 'package:movies/presentation/search/cubit/selectable_option_cubit.dart';
import 'package:movies/presentation/search/widgets/search_field.dart';
import 'package:movies/presentation/search/widgets/selectable_option.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        hideBack: false,
        title: Text(
          "Search",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SelectableOptionCubit(),
          ),
        ],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SearchField(),
              const SizedBox(
                height: 16,
              ),
              BlocBuilder<SelectableOptionCubit, SearchType>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SelectableOption(
                        title: "Movie",
                        isSelected:
                            context.read<SelectableOptionCubit>().state ==
                                SearchType.moive,
                        onTap: () => {
                          context.read<SelectableOptionCubit>().selectMovie()
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SelectableOption(
                        title: "TV",
                        isSelected:
                            context.read<SelectableOptionCubit>().state ==
                                SearchType.tv,
                        onTap: () =>
                            {context.read<SelectableOptionCubit>().selectTv()},
                      ),
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
