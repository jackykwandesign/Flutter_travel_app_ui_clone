class Hotel {
  String imageURL;
  String name;
  String address;
  int price;

  Hotel({
    required this.imageURL,
    required this.name,
    required this.address,
    required this.price,
  });
}

List<Hotel> hotels = [
  Hotel(
    imageURL: 'assets/images/hotel0.jpg',
    name: 'Hotel 0',
    address: '404 Great St',
    price: 175,
  ),
  Hotel(
    imageURL: 'assets/images/hotel1.jpg',
    name: 'Hotel 1',
    address: '404 Great St',
    price: 300,
  ),
  Hotel(
    imageURL: 'assets/images/hotel2.jpg',
    name: 'Hotel 2',
    address: '404 Great St',
    price: 240,
  ),
];
