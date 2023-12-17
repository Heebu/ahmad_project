import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../ViewModel/IntroViewModel/sign_up_viewmodel.dart';

class SignupView extends StatelessWidget {
  const SignupView({
    Key? key,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(viewModelBuilder: () => SignupViewModel(), builder: (context, viewModel, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Sign Up'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Image.asset('images/brand.png'),
              SizedBox(height: 10,),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
                onChanged: viewModel.updateEmail,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
                onChanged: viewModel.updatePassword,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
                onChanged: viewModel.updateName,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                ),
                keyboardType: TextInputType.phone,
                onChanged: viewModel.updatePhone,
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                onPressed: (){
                  viewModel.signup(context);
                },
                child: const Text('Sign Up'),
              ),
              TextButton(
                child: const Text('Already have an account? Login'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      );
    },);
  }
}
