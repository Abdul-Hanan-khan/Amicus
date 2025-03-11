class MyBountiesModel {
  List<BounteyItem>? data;

  MyBountiesModel({this.data});

  MyBountiesModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <BounteyItem>[];
      json['data'].forEach((v) {
        data!.add(new BounteyItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BounteyItem {
  String? referenceId;
  String? make;
  String? model;
  String? color;
  String? licensePlate;
  String? location;
  String? timestamp;
  Images? images;
  String? sentTo;
  String? enforcementOffice;
  String? contactNumber;
  String? additionalInformation;
  String? locationId;

  BounteyItem(
      {this.referenceId,
        this.make,
        this.model,
        this.color,
        this.licensePlate,
        this.location,
        this.timestamp,
        this.images,
        this.sentTo,
        this.enforcementOffice,
        this.contactNumber,
        this.additionalInformation,
        this.locationId});

  BounteyItem.fromJson(Map<String, dynamic> json) {
    referenceId = json['reference_id'];
    make = json['make'];
    model = json['model'];
    color = json['color'];
    licensePlate = json['license_plate'];
    location = json['location'];
    timestamp = json['timestamp'];
    images =
    json['images'] != null ? new Images.fromJson(json['images']) : null;
    sentTo = json['sent_to'];
    enforcementOffice = json['enforcement_office'];
    contactNumber = json['contact_number'];
    additionalInformation = json['additional_information'];
    locationId = json['location_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reference_id'] = this.referenceId;
    data['make'] = this.make;
    data['model'] = this.model;
    data['color'] = this.color;
    data['license_plate'] = this.licensePlate;
    data['location'] = this.location;
    data['timestamp'] = this.timestamp;
    if (this.images != null) {
      data['images'] = this.images!.toJson();
    }
    data['sent_to'] = this.sentTo;
    data['enforcement_office'] = this.enforcementOffice;
    data['contact_number'] = this.contactNumber;
    data['additional_information'] = this.additionalInformation;
    data['location_id'] = this.locationId;
    return data;
  }
}

class Images {
  String? front;
  String? back;
  String? side;
  String? context;

  Images({this.front, this.back, this.side, this.context});

  Images.fromJson(Map<String, dynamic> json) {
    front = json['front'];
    back = json['back'];
    side = json['side'];
    context = json['context'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['front'] = this.front;
    data['back'] = this.back;
    data['side'] = this.side;
    data['context'] = this.context;
    return data;
  }
}
