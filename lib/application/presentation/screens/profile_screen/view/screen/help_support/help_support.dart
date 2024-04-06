import 'package:bizkit/application/business_logic/profile/profile_bloc.dart';
import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:bizkit/application/presentation/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/application/presentation/utils/shimmier/shimmer.dart';
import 'package:bizkit/application/presentation/utils/text_field/textform_field.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/widgets/refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HelpSupport extends StatefulWidget {
  const HelpSupport({super.key, this.scrollController});
  final ScrollController? scrollController;
  @override
  State<HelpSupport> createState() => _HelpSupportState();
}

class _HelpSupportState extends State<HelpSupport> {
  _scrollCallBack() {
    final maxScroll = widget.scrollController!.position.maxScrollExtent;
    final currentScroll = widget.scrollController!.position.pixels;
    var delta = 100.0;
    if (maxScroll - currentScroll <= delta) {
      context.read<ProfileBloc>().add(const ProfileEvent.getQuestionEvent());
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.scrollController != null) {
      _scrollCallBack();
    }
  }

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context
            .read<ProfileBloc>()
            .add(const ProfileEvent.getQuestions(serachQuery: ''));
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
          child: Column(
            children: [
              adjustHieght(khieght * .02),
              Text(
                'How can we Help You',
                style: TextStyle(fontSize: 18.sp),
              ),
              adjustHieght(khieght * .01),
              BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  return TTextFormField(
                    onChanaged: (value) {
                      context
                          .read<ProfileBloc>()
                          .add(ProfileEvent.searchQuestion(serachQuery: value));
                    },
                    su: const Icon(Icons.search_rounded),
                    text: 'Search here',
                    controller: textEditingController,
                    inputType: TextInputType.name,
                  );
                },
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
                  } else if (state.questionList == null) {
                    return RefreshIndicatorCustom(
                      message: errorMessage,
                      onRefresh: () => context
                          .read<ProfileBloc>()
                          .add(const ProfileEvent.getQuestionEvent()),
                    );
                  } else if (state.questionList!.isEmpty) {
                    return SizedBox(
                      height: khieght * .55,
                      child: const Center(
                        child: Text('No questions'),
                      ),
                    );
                  }
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: (state.questionList?.length ?? 0) +
                        (state.questionLoading ? 1 : 0),
                    itemBuilder: (context, index) {
                      final question = state.questionList![index];
                      if (state.questionLoading &&
                          index == state.questionList?.length) {
                        return const LoadingAnimation();
                      }
                      return ExpansionTile(
                        title: Text(
                          question.question!,
                          style: const TextStyle(color: kwhite),
                        ),
                        children: [
                          Text(question.answer!),
                        ],
                      );
                    },
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
