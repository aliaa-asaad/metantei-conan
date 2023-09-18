import 'package:detective_conan/features/home/data/model/all_characters_model.dart';
import 'package:detective_conan/routing/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../routing/routes.dart';
import '../../../../utilities/media_quary.dart';

class CustomGridView extends StatelessWidget {
  final List<AllCharacters> character;
  const CustomGridView({
    super.key,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 3 / 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: character.length,
      itemBuilder: (ctx, index) {
        return InkWell(
          onTap:
              () => /* Navigator.pushNamed(context, blocCharacterDetailsScreen,
            arguments: character), */
                  AppRoutes.pushNamedNavigator(
                      routeName: Routes.characterDetails,
                      arguments: character[index].name),
          child: Container(
              width: MediaQueryHelper.width,
              padding: EdgeInsets.all(4.r),
              decoration: BoxDecoration(
                //color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.2),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      // margin: EdgeInsetsDirectional.all(4.r),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        image: DecorationImage(
                          image: NetworkImage(character[index].picture!),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQueryHelper.height * .01,
                  ),
                  Text(
                    '${character[index].name}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ) /* GridTile(
              child: Container(
                // margin: EdgeInsetsDirectional.all(4.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  image: DecorationImage(
                    image: NetworkImage(character[index].picture!),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              footer: Container(
                // height:MediaQueryHelper.height*.03,
                padding: EdgeInsets.symmetric(horizontal: 8.r, vertical: 4.r),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(8.r),
                        bottomLeft: Radius.circular(8.r)),
                    color: Colors.black54),
                //  width: 100,
                // alignment: Alignment.center,
                child: Column(
                  children: [
                    Text(
                      '${character[index].name}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ),
            ),
         */
              ),
        );
      },
    );
  }
}
