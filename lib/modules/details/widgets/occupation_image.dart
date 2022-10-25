import 'package:breaking_bad/modules/details/providers/details_provider.dart';
import 'package:breaking_bad/utils/app_sizes/app_dimensions.dart';
import 'package:breaking_bad/utils/app_sizes/app_strings.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class OccupationImageWidget extends StatelessWidget {
  const OccupationImageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    return SizedBox(
      height: height * AppDimensions.characterDetailsRatio026,
      width: double.infinity,
      child: context.watch<DetailsProvider>().occupationImageLoading == true
          ? const Center(child: CircularProgressIndicator())
          : context.watch<DetailsProvider>().occupationImage == ''
              ? Center(
                  child: Text(AppStrings.sorryWeCantFindAnyImage,
                      style: Theme.of(context).textTheme.displayMedium))
              : Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              context.watch<DetailsProvider>().occupationImage),
                          fit: BoxFit.cover),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(AppDimensions.radius30),
                        bottomRight: Radius.circular(AppDimensions.radius30),
                      )),
                ),
    );
  }
}
