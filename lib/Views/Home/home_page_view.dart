import 'package:ahmad_project/Views/Home/side_drawer.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../ViewModel/HomeViewModel/home_page_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          drawer: CustomDrawer(),
          appBar: AppBar(
            title: const Text('Home & Rents'),
          ),
          body: viewModel.isLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: viewModel.properties.length,
                  itemBuilder: (context, index) {
                    final property = viewModel.properties[index];
                    return ListTile(
                      leading: Image.asset(property.imageURL),
                      title: Text(property.address),
                      subtitle: Text(
                        property.isRented
                            ? 'Rent: ${property.price}'
                            : 'Sale: ${property.price}',
                      ),
                      onTap: () =>
                          viewModel.navigateToPropertyDetails(property),
                    );
                  },
                ),
        );
      },
    );
  }
}
