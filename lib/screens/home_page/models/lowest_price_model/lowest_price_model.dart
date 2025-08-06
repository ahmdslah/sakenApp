class LowestPriceModel {
  final int? id;
  final String? title;
  final String? address;
  final double? pricePerMeter;
  final int? areaInMeters;
  final int? floor;
  final String? housingType;
  final String? furnishingStatus;
  final String? rentalType;
  final double? rate;
  final String? photoUrl;
  final String? ownerName;
  final String? ownerId;

  LowestPriceModel({
    this.id,
    this.title,
    this.address,
    this.pricePerMeter,
    this.areaInMeters,
    this.floor,
    this.housingType,
    this.furnishingStatus,
    this.rentalType,
    this.rate,
    this.photoUrl,
    this.ownerName,
    this.ownerId,
  });

  factory LowestPriceModel.fromJson(Map<String, dynamic> json) {
    return LowestPriceModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      address: json['address'] as String?,
      pricePerMeter: (json['pricePerMeter'] as num?)?.toDouble(),
      areaInMeters: json['areaInMeters'] as int?,
      floor: json['floor'] as int?,
      housingType: json['housingType'] as String?,
      furnishingStatus: json['furnishingStatus'] as String?,
      rentalType: json['rentalType'] as String?,
      rate: (json['rate'] as num?)?.toDouble(),
      photoUrl: json['photoUrl'] as String?,
      ownerName: json['ownerName'] as String?,
      ownerId: json['ownerId'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'address': address,
        'pricePerMeter': pricePerMeter,
        'areaInMeters': areaInMeters,
        'floor': floor,
        'housingType': housingType,
        'furnishingStatus': furnishingStatus,
        'rentalType': rentalType,
        'rate': rate,
        'photoUrl': photoUrl,
        'ownerName': ownerName,
        'ownerId': ownerId,
      };
}
