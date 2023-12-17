import 'package:ahmad_project/ViewModel/HomeViewModel/side_bar.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

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
          child: FutureBuilder(
            future: viewModel.getUserProfile(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                final user = snapshot.data;
                return Column(
                  children: [
                    if (user != null)
                      Center(
                        child: UserAccountsDrawerHeader(
                          currentAccountPicture: const CircleAvatar(
                            backgroundImage: AssetImage(
                              // Replace with logic to get user image URL
                              'images/intro1.png',
                            ),
                          ),
                          accountName: Text(user.name),
                          accountEmail: Text(user.email),
                        ),
                      ),
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text('Profile'),
                      onTap: viewModel.navigateToProfileEdit,
                    ),
                    ListTile(
                      leading: Icon(Icons.settings),
                      title: Text('Settings'),
                      onTap: viewModel.navigateToSettings,
                    ),
                    ListTile(
                      leading: Icon(Icons.help),
                      title: Text('Help'),
                      onTap: viewModel.navigateToHelp,
                    ),
                    ListTile(
                      leading: Icon(Icons.info),
                      title: Text('About'),
                      onTap: viewModel.navigateToAbout,
                    ),
                    ListTile(
                      leading: Icon(Icons.question_mark),
                      title: Text('FAQ'),
                      onTap: viewModel.navigateToFAQ,
                    ),
                  ],
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        );
      },
    );
  }
}
