import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../ViewModel/HomeViewModel/edit_profile_viewmodel.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onViewModelReady: (viewModel) => viewModel.getUserProfile(),
      viewModelBuilder: () => EditProfileViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Edit Profile'),
          ),
          body: SingleChildScrollView(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          viewModel.imagePic(context);
                        },
                        child: viewModel.image == ''
                            ? CircleAvatar(
                                radius: 50.r,
                                child: Icon(
                                  Icons.person,
                                  size: 40.sp,
                                ),
                              )
                            : CircleAvatar(
                                radius: 50.r,
                                backgroundImage: NetworkImage(viewModel.image),
                              ),
                      ),
                    ),
                    EditTextField(
                      controller: viewModel.firstNameController,
                      hint: viewModel.firstName,
                      textInputType: TextInputType.name,
                    ),
                    EditTextField(
                      controller: viewModel.lastNameController,
                      hint: viewModel.lastName,
                      textInputType: TextInputType.name,
                    ),
                    EditTextField(
                      controller: viewModel.phoneNumberController,
                      hint: viewModel.phone,
                      textInputType: TextInputType.number,
                    ),
                    EditTextField(
                      controller: viewModel.addressLocationController,
                      hint: viewModel.state,
                      textInputType: TextInputType.streetAddress,
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    viewModel.isLoading == true
                        ? CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: () {
                              viewModel.updateProfile(context);
                            },
                            child: SizedBox(
                              height: 50.h,
                              width: 50.w,
                              child: Center(child: Text('Submit')),
                            ))
                  ],
                )),
          ),
        );
      },
    );
  }
}

class EditTextField extends StatelessWidget {
  const EditTextField({
    super.key,
    required this.hint,
    required this.textInputType,
    required this.controller,
  });

  final String hint;
  final TextInputType textInputType;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      margin: EdgeInsets.symmetric(vertical: 10.h),
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
          color: Colors.purple.shade50,
          borderRadius: BorderRadius.circular(10.r)),
      child: TextField(
          controller: controller,
          keyboardType: textInputType,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hint,
          )),
    );
  }
}
