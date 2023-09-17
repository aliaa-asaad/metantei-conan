import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metantei_conan/app_widgets/custom_app_bar.dart';
import 'package:metantei_conan/app_widgets/custom_background.dart';
import 'package:metantei_conan/features/home/data/model/all_characters_model.dart';
import 'package:metantei_conan/features/home/data/view_model/cubit/all_characters_cubit.dart';

import 'package:lottie/lottie.dart';
import '../../../../utilities/images.dart';
import '../../../../utilities/media_quary.dart';
import '../widgets/custom_grid_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // var bloc = BlocProvider.of<AllCharactersCubit>(context);

    return Scaffold(
      body: CustomBackground(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(8.0.r),
            child: BlocBuilder<AllCharactersCubit, AllCharactersState>(
                builder: (context, state) {
              if (state is AllCharactersLoaded) {
                List<AllCharacters> allCharacters = (state).allCharactersState;
                return Column(
                  children: [
                    CustomAppBar(
                      isHome: true,
                      onChanged: (value) {
                        BlocProvider.of<AllCharactersCubit>(context)
                            .getSearchedCharacter(value);

                        
                      },
                    ),
                    Expanded(child: CustomGridView(character: allCharacters)),
                  ],
                );
              } else {
                return Center(
                  child: Lottie.asset(
                    AppImages.loading,
                    height: MediaQueryHelper.height * 0.4,
                    width: MediaQueryHelper.width * 0.4,
                  ),
                );
              }
            }),
          ),
        ),
      ),
    );
  }
}
