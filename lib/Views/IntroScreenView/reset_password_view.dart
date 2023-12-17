import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../ViewModel/IntroViewModel/reset_password_viewmodel.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ResetPasswordViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Reset Password'),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Image.asset('images/brand.png'),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Enter the email address associated with your account, and we\'ll send you instructions to reset your password.',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                  onChanged: viewModel.updateEmail,
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    viewModel.requestPasswordReset(context);
                  },
                  child: const Text('Reset Password'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
