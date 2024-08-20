class OffersModel {
  final String discount;
  final String end;
  final String id;
  final String image;
  final String price;
  final String rating;
  final String start;
  final String title;

  OffersModel({
    required this.discount,
    required this.end,
    required this.id,
    required this.image,
    required this.price,
    required this.rating,
    required this.start,
    required this.title,
  });

  factory OffersModel.fromJson(Map<String, dynamic> json) {
    return OffersModel(
      discount: json['discount'] ?? '',
      end: json['end'] ?? '',
      id: json['id'] ?? '',
      image: json['image'] ?? '',
      price: json['price'] ?? '',
      rating: json['rating'] ?? '',
      start: json['start'] ?? '',
      title: json['title'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'discount': discount,
      'end': end,
      'id': id,
      'image': image,
      'price': price,
      'rating': rating,
      'start': start,
      'title': title,
    };
  }
}
