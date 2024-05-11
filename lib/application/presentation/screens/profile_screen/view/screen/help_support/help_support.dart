import 'package:bizkit/application/business_logic/profile/profile_bloc.dart';
import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:bizkit/application/presentation/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/application/presentation/utils/refresh_indicator/refresh_custom.dart';
import 'package:bizkit/application/presentation/utils/shimmier/shimmer.dart';
import 'package:bizkit/application/presentation/utils/text_field/textform_field.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/widgets/expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HelpSupport extends StatefulWidget {
  const HelpSupport({super.key});

  @override
  State<HelpSupport> createState() => _HelpSupportState();
}

class _HelpSupportState extends State<HelpSupport> {
  late ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        context.read<ProfileBloc>().add(ProfileEvent.getQuestionEvent(
            searchData: context.read<ProfileBloc>().faqSearchController.text));
      }
    });
  }

  Future<void> onRefresh() async {
    context
        .read<ProfileBloc>()
        .add(const ProfileEvent.getQuestions(serachQuery: ''));
    await Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context.read<ProfileBloc>().add(ProfileEvent.getQuestions(
            serachQuery: context.read<ProfileBloc>().faqSearchController.text));
      },
    );
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 18,
            color: kwhite,
          ),
        ),
        backgroundColor: knill,
        title: Text(
          'Help & Support',
          style: TextStyle(color: kwhite, fontSize: 16.sp),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          controller: scrollController,
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              adjustHieght(khieght * .02),
              Text(
                'How can we Help You',
                style: TextStyle(fontSize: 18.sp),
              ),
              adjustHieght(khieght * .01),
              CustomTextFormField(
                onChanaged: (value) {
                  context
                      .read<ProfileBloc>()
                      .add(ProfileEvent.getQuestions(serachQuery: value));
                },
                prefixIcon: const Icon(Icons.search_rounded),
                labelText: 'Search here',
                controller: context.read<ProfileBloc>().faqSearchController,
                inputType: TextInputType.name,
              ),
              adjustHieght(khieght * .02),
              Text(
                'Top questions',
                style: TextStyle(fontSize: 16.sp),
              ),
              adjustHieght(khieght * .02),
              BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  if (state.questionLoading) {
                    return ShimmerLoader(
                      itemCount: 10,
                      height: 60,
                      width: kwidth * 0.9,
                      seprator: const SizedBox(height: 10),
                    );
                  } else if (state.questionList.isNotEmpty) {
                    int length = state.questionEvenLoading
                        ? state.questionList.length + 1
                        : state.questionList.length;

                    return RefreshIndicator(
                      onRefresh: () async {
                        context.read<ProfileBloc>().add(
                              ProfileEvent.getQuestions(
                                  serachQuery: context
                                      .read<ProfileBloc>()
                                      .faqSearchController
                                      .text),
                            );
                      },
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: length,
                        itemBuilder: (context, index) {
                          if (state.questionList.length < 10 &&
                              index == state.questionList.length + 1) {
                            return const SizedBox(height: 100);
                          }
                          final question = state.questionList[index];
                          if (state.questionEvenLoading &&
                              index == state.questionList.length - 1) {
                            return const LoadingAnimation();
                          }
                          return CustomExpansionTile(
                            title: Text(
                              question.question ?? '',
                              style: const TextStyle(
                                color: kwhite,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            children: [
                              Text(
                                question.answer ?? '',
                                style: const TextStyle(
                                  color: kwhite,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  } else {
                    return ErrorRefreshIndicator(
                      shrinkWrap: true,
                      image: emptyNodata2,
                      errorMessage: 'No Questions found',
                      onRefresh: onRefresh,
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
