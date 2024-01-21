import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../ViewModel/IntroViewModel/sign_up_viewmodel.dart';

class SignupView extends StatelessWidget {
  const SignupView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => SignupViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Sign Up'),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    viewModel.imagePicked(context);
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
                TextField(
                  controller: viewModel.firstNameController,
                  decoration: const InputDecoration(
                    labelText: 'First Name',
                  ),
                ),
                TextField(
                  controller: viewModel.lastNameController,
                  decoration: const InputDecoration(
                    labelText: 'Last Name',
                  ),
                ),
                TextField(
                  controller: viewModel.emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                ),
                TextField(
                  controller: viewModel.phoneNumberController,
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                  ),
                  keyboardType: TextInputType.phone,
                ),
                TextField(
                  controller: viewModel.stateController,
                  decoration: const InputDecoration(
                    labelText: 'Location address',
                  ),
                  keyboardType: TextInputType.streetAddress,
                ),
                TextField(
                  controller: viewModel.passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                ),
                TextField(
                  controller: viewModel.confirmPasswordController,
                  decoration: const InputDecoration(
                    labelText: 'Confirm Password',
                  ),
                  obscureText: true,
                ),
                SizedBox(
                  height: 20.h,
                ),
                viewModel.isLoading == false
                    ? ElevatedButton(
                        onPressed: () {
                          viewModel.signup(context);
                        },
                        child: const Text('Sign Up'),
                      )
                    : const CircularProgressIndicator(),
                TextButton(
                  child: const Text('Already have an account? Login'),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
