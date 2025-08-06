class SakanModel {
  int? id;
  String? title;
  String? address;
  double? pricePerMeter;
  int? areaInMeters;
  int? floor;
  String? housingType;
  String? furnishingStatus;
  String? rentalType;
  dynamic rate;
  String? photoUrl;
  String? ownerName;
  String? ownerId;

  SakanModel({
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

  factory SakanModel.fromJson(Map<String, dynamic> json) {
    return SakanModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      address: json['address'] as String?,
      pricePerMeter: (json['pricePerMeter'] as num?)?.toDouble(),
      areaInMeters: json['areaInMeters'] as int?,
      floor: json['floor'] as int?,
      housingType: json['housingType'] as String?,
      furnishingStatus: json['furnishingStatus'] as String?,
      rentalType: json['rentalType'] as String?,
      rate: json['rate'] as dynamic,
      photoUrl: json['photoUrl'] as String?,
      ownerName: json['ownerName'] as String?,
      ownerId: json['ownerId'] as String?,
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
