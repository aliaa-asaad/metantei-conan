import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:metantei_conan/app_widgets/custom_app_bar.dart';
import 'package:metantei_conan/features/character_details/data/model/character_details_model.dart';

import '../../../../app_widgets/custom_background.dart';
import '../../../../utilities/images.dart';
import '../../../../utilities/media_quary.dart';
import '../../data/view_model/cubit/character_details_cubit.dart';

class CharacterDetailsScreen extends StatelessWidget {
  const CharacterDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //3
    //الطرريقة دي بستخدمها عشان اكول الميثود اللي هتجيب الداتا بدل ما اعملها في الكونستركتور
    var bloc = BlocProvider.of<CharacterDetailsCubit>(context);
    bloc.getCharacterDetailsCubit();

    return Scaffold(
      body: CustomBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: BlocBuilder<CharacterDetailsCubit, CharacterDetailsState>(
              builder: (context, state) {
                if (state is CharacterDetailsLoaded) {
                  List<Map<String, String?>> details = [
                    {
                      'name': 'English Name',
                      'value': bloc.character.englishName,
                    },
                    {
                      'name': 'Japanese Name',
                      'value': bloc.character.japaneseName,
                    },
                    {
                      'name': 'Age',
                      'value': bloc.character.age,
                    },
                    {
                      'name': 'Gender',
                      'value': bloc.character.gender,
                    },
                    {
                      'name': 'Height',
                      'value': bloc.character.height,
                    },
                    {
                      'name': 'Weight',
                      'value': bloc.character.weight,
                    },
                    {
                      'name': 'Date of birth',
                      'value': bloc.character.dateOfBirth,
                    },
                    {
                      'name': 'Relatives',
                      'value': bloc.character.relatives,
                    },
                    {
                      'name': 'Occupation',
                      'value': bloc.character.occupation,
                    },
                    {
                      'name': 'Status',
                      'value': bloc.character.status,
                    },
                    {
                      'name': 'Aliases',
                      'value': bloc.character.aliases,
                    },
                  ];
                  return Column(
                    children: [
                      /* CustomAppBar(
                        isHome: false,
                        isPop: true,
                      ), */
                      Expanded(
                        child: ListView(children: [
                          Container(
                            margin: EdgeInsets.all( 8.r),
                            height: MediaQueryHelper.height * .4,
                            width: MediaQueryHelper.width,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    '${bloc.character.image}',
                                  ),
                                  fit: BoxFit.fill,
                                ),
                                borderRadius: BorderRadius.circular(16.r)),
                          ),
                          Column(
                            children: List.generate(
                              details.length,
                              (index) => Column(
                                children: [
                                  ListTile(
                                    title: Text(
                                      '${details[index]['name']}:',
                                      style: Theme.of(context).textTheme.titleMedium,
                                    ),
                                    subtitle: Text(
                                      '${details[index]['value']}',
                                      style: Theme.of(context).textTheme.bodyMedium,
                                    ),
                                  ),
                                   Divider(
                                color: Theme.of(context).colorScheme.primary,
                                thickness: 1,endIndent: 10,
                                indent: 10,
                              ),
                                ],
                              ),
                             
                            ), /* Text('${state.charactersState.englishName}'), */
                          )
                        ]),
                      ),
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
              },
            ),
          ),
        ),
      ),
    );
  }
}
