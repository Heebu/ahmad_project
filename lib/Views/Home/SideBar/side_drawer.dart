import 'package:ahmad_project/ViewModel/HomeViewModel/side_bar.dart';
import 'package:ahmad_project/Views/Home/SideBar/rules_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'about_view.dart';
import 'news_view.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ProfileViewModel(),
      builder: (context, viewModel, child) {
        return Drawer(
            child: SafeArea(
          child: Column(
            children: [
              FutureBuilder(
                future: viewModel.getUserProfile(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    final user = snapshot.data;
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (user != null)
                          Center(
                            child: UserAccountsDrawerHeader(
                              currentAccountPicture: GestureDetector(
                                  onTap: () {
                                    viewModel.imagePic(context);
                                  },
                                  child: viewModel.image != ''
                                      ? CircleAvatar(
                                          backgroundImage: NetworkImage(
                                            // Replace with logic to get user image URL
                                            viewModel.image,
                                          ),
                                        )
                                      : CircleAvatar(
                                          child: Icon(Icons.person),
                                        )),
                              accountName: Text(viewModel.name),
                              accountEmail: Text(user.email),
                            ),
                          ),
                      ],
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
              //loading
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Profile'),
                onTap: () {
                  viewModel.navigateToProfileEdit(context);
                },
              ),

              ListTile(
                leading: Icon(Icons.event_note_outlined),
                title: Text('News'),
                onTap: () {
                  viewModel.navigateToScreen(context, NewsView());
                },
              ),
              ListTile(
                leading: Icon(Icons.question_mark),
                title: Text('Rules'),
                onTap: () {
                  viewModel.navigateToScreen(context, RulesView());
                },
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text('About'),
                onTap: () {
                  viewModel.navigateToScreen(context, AboutViews());
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
                title: Text('Log-out'),
                onTap: () {
                  Navigator.pop(context);
                  viewModel.logOutFunction(context);
                },
              ),
            ],
          ),
        ));
      },
    );
  }
}
