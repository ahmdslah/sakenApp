class HigestPriceModel {
  final int? id;
  final dynamic title;
  final String? address;
  final double? pricePerMeter;
  final int? areaInMeters;
  final int? floor;
  final String? housingType;
  final String? furnishingStatus;
  final dynamic rentalType;
  final int? rate;
  final String? photoUrl;
  final String? ownerName;
  final dynamic ownerId;

  HigestPriceModel({
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

  factory HigestPriceModel.fromJson(Map<String, dynamic> json) {
    return HigestPriceModel(
      id: json['id'] as int?,
      title: json['title'] as dynamic,
      address: json['address'] as String?,
      pricePerMeter: (json['pricePerMeter'] as num?)?.toDouble(),
      areaInMeters: json['areaInMeters'] as int?,
      floor: json['floor'] as int?,
      housingType: json['housingType'] as String?,
      furnishingStatus: json['furnishingStatus'] as String?,
      rentalType: json['rentalType'] as dynamic,
      rate: json['rate'] as int?,
      photoUrl: json['photoUrl'] as String?,
      ownerName: json['ownerName'] as String?,
      ownerId: json['ownerId'] as dynamic,
    );
  }

  Map<String, dynamic> toJson() {
    return {
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
}
