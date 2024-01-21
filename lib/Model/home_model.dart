class ListedProperty {
  final String id;
  final String address;
  final String imageURL;
  final String useFor;
  final int price;
  final bool isRented; // True if rented, False if for sale

  const ListedProperty({
    required this.id,
    required this.address,
    required this.imageURL,
    required this.useFor,
    required this.price,
    required this.isRented,
  });
}
