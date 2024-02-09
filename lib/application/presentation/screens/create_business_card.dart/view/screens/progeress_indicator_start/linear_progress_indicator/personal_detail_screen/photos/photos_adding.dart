import 'package:bizkit/application/business_logic/card/user_data/user_data_bloc.dart';
import 'package:bizkit/application/presentation/screens/authentication/view/widgets/auth_button.dart';
import 'package:bizkit/application/presentation/utils/appbar.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhotosAddingScreen extends StatelessWidget {
  const PhotosAddingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(kwidth, 70),
        child: const AppbarCommen(
          tittle: 'Photo',
        ),
      ),
      body: Column(
        children: [
          Center(
            child: DottedBorder(
              dashPattern: const [8, 8],
              color: neonShade,
              strokeWidth: 2.5,
              child: SizedBox(
                width: 290.dm,
                height: 91.dm,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 32.dm,
                      height: 32.dm,
                      child: CircleAvatar(
                        child: IconButton(
                          onPressed: () {
                            context
                                .read<UserDataBloc>()
                                .add(UserDataEvent.pickUserPhotos());
                          },
                          icon: const Icon(Icons.add),
                        ),
                      ),
                    ),
                    Text(
                      'Add photos',
                      style: TextStyle(fontSize: 10.sp),
                    ),
                  ],
                ),
              ),
            ),
          ),
          adjustHieght(20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: BlocBuilder<UserDataBloc, UserDataState>(
              builder: (context, state) {
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.userPhotos.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 100,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20
                  ),
                  itemBuilder: (context, index) {
                    return Image.file( state.userPhotos[index].fileImage,fit: BoxFit.cover);
                  },
                );
              },
            ),
          ),
          const Spacer(),
          adjustHieght(khieght * .02),
          AuthButton(
            text: 'Save',
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          adjustHieght(40)
        ],
      ),
    );
  }
}
