import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../ViewModel/IntroViewModel/login_viewmodel.dart';

class LoginView extends StatelessWidget {

  const LoginView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(viewModelBuilder: () => LoginViewModel(), builder: (context, viewModel, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
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
                  hintText: 'example@gmail.com'
                ),
                onChanged: viewModel.updateEmail,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Password',
                  hintText: '*******'
                ),
                obscureText: true,
                onChanged: viewModel.updatePassword,
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                onPressed: (){
                  viewModel.login(context);
                },
                child: const Text('Login'),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    child: const Text('Forgot Password?'),
                    onPressed: () {
                      viewModel.resetPassword(context);
                    },
                  ),
                  ElevatedButton(onPressed: (){
                    viewModel.createAccount(context);
                  }, child: Text('Create an account'))
                ],
              ),
            ],
          ),
        ),
      );
    },);
  }
}
