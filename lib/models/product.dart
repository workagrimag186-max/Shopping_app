class Product {
  final String id;
  final String name;
  final double price;
  final String image;
  final String description; // Add this

  Product({
    required this.id, 
    required this.name, 
    required this.price, 
    required this.image,
    required this.description, // Add this
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'].toString(),
      name: json['title'],
      price: json['price'].toDouble(),
      image: json['image'],
      description: json['description'], // Add this
    );
  }
}