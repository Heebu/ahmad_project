import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../ViewModel/HomeViewModel/home_viewmodel.dart';
import 'item_preview.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onViewModelReady: (viewModel) => viewModel.retrieveProducts,
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Homes & properties'),
          ),
          body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('Properties')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data == null) {
                    return Center(child: Text('No items available'));
                  }

                  final List<DocumentSnapshot> items = snapshot.data!.docs;

                  return ListView.separated(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index].data() as Map<String, dynamic>;
                      String name = item['name'] ?? '';
                      String image = item['coverImage'] ?? '';
                      String price = item['price'] ?? '';
                      String description = item['description'] ?? '';
                      String location = item['location'] ?? '';
                      String contact = item['contact'] ?? '';
                      bool isRent = item['isRent'] ?? true;
                      String type = item['type'] ?? 'Homes';

                      return type == 'Homes'
                          ? ListTile(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ItemPreview(
                                        name: name,
                                        price: price,
                                        description: description,
                                        location: location,
                                        image: image,
                                        isRent: isRent,
                                        contact: contact,
                                        type: type,
                                      ),
                                    ));
                              },
                              leading: Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: Colors.purple.shade50,
                                    image: DecorationImage(
                                        image: NetworkImage(image),
                                        fit: BoxFit.cover)),
                              ),
                              title: Text(name),
                              subtitle: Text(location),
                              trailing: Icon(Icons.arrow_forward_ios),
                            )
                          : const SizedBox.shrink();
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(
                      height: 10,
                    ),
                  );
                },
              )),
        );
      },
    );
  }
}
