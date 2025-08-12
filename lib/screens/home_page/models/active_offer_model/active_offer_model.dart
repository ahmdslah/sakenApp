class ActiveOfferModel {
  int? housingId;
  String? title;
  String? address;
  double? discountedPrice;
  String? offerType;
  int? rating;
  int? rooms;
  String? photoUrl;

  ActiveOfferModel({
    this.housingId,
    this.title,
    this.address,
    this.discountedPrice,
    this.offerType,
    this.rating,
    this.rooms,
    this.photoUrl,
  });

  factory ActiveOfferModel.fromJson(
      Map<String, dynamic> json) {
    return ActiveOfferModel(
      housingId: json['housingId'] as int?,
      title: json['title'] as String?,
      address: json['address'] as String?,
      discountedPrice: (json['discountedPrice'] as num?)?.toDouble(),
      offerType: json['offerType'] as String?,
      rating: json['rating'] as int?,
      rooms: json['rooms'] as int?,
      photoUrl: json['photoUrl'] as String?,
    );
  }

  Map<String, dynamic>
      toJson() {
    return {
      'housingId': housingId,
      'title': title,
      'address': address,
      'discountedPrice': discountedPrice,
      'offerType': offerType,
      'rating': rating,
      'rooms': rooms,
      'photoUrl': photoUrl,
    };
  }
}
