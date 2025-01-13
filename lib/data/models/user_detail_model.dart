import 'package:efra_intern/domain/entities/user_detail.dart';

class UserDetailModel extends UserDetail {
  UserDetailModel(
      {required super.id,
      required super.username,
      required super.email,
      required super.firstName,
      required super.lastName,
      required super.gender,
      required super.image,
      required super.maidenName,
      required super.age,
      required super.phone,
      required super.birthDate,
      required super.bloodGroup,
      required super.height,
      required super.weight,
      required super.eyeColor,
      required super.hair,
      required super.ip,
      required super.address,
      required super.macAddress,
      required super.university,
      required super.bank,
      required super.company,
      required super.ein,
      required super.ssn,
      required super.userAgent,
      required super.crypto,
      required super.role});

  factory UserDetailModel.fromJson(Map<String, dynamic> json) {
    return UserDetailModel(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      gender: json['gender'],
      image: json['image'],
      maidenName: json['maidenName'],
      age: json['age'],
      phone: json['phone'],
      birthDate: json['birthDate'],
      bloodGroup: json['bloodGroup'],
      height: (json['height'] as num).toDouble(),
      weight: (json['weight'] as num).toDouble(),
      eyeColor: json['eyeColor'],
      hair: HairModel.fromJson(json['hair']),
      ip: json['ip'],
      address: AddressModel.fromJson(json['address']),
      macAddress: json['macAddress'],
      university: json['university'],
      bank: BankModel.fromJson(json['bank']),
      company: CompanyModel.fromJson(json['company']),
      ein: json['ein'],
      ssn: json['ssn'],
      userAgent: json['userAgent'],
      crypto: CryptoModel.fromJson(json['crypto']),
      role: json['role'],
    );
  }
}

class HairModel extends Hair {
  HairModel({required super.color, required super.type});

  factory HairModel.fromJson(Map<String, dynamic> json) {
    return HairModel(
      color: json['color'],
      type: json['type'],
    );
  }
}

class AddressModel extends Address {
  AddressModel(
      {required super.address,
      required super.city,
      required super.state,
      required super.stateCode,
      required super.postalCode,
      required super.coordinates,
      required super.country});

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      address: json['address'],
      city: json['city'],
      state: json['state'],
      stateCode: json['stateCode'],
      postalCode: json['postalCode'],
      coordinates: CoordinatesModel.fromJson(json['coordinates']),
      country: json['country'],
    );
  }
}

class CoordinatesModel extends Coordinates {
  CoordinatesModel({required super.lat, required super.lng});

  factory CoordinatesModel.fromJson(Map<String, dynamic> json) {
    return CoordinatesModel(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );
  }
}

class BankModel extends Bank {
  BankModel(
      {required super.cardExpire,
      required super.cardNumber,
      required super.cardType,
      required super.currency,
      required super.iban});

  factory BankModel.fromJson(Map<String, dynamic> json) {
    return BankModel(
      cardExpire: json['cardExpire'],
      cardNumber: json['cardNumber'],
      cardType: json['cardType'],
      currency: json['currency'],
      iban: json['iban'],
    );
  }
}

class CompanyModel extends Company {
  CompanyModel({
    required super.department,
    required super.name,
    required super.title,
    required super.address,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      department: json['department'],
      name: json['name'],
      title: json['title'],
      address: AddressModel.fromJson(json['address']),
    );
  }
}

class CryptoModel extends Crypto {
  CryptoModel({
    required super.coin,
    required super.wallet,
    required super.network,
  });

  factory CryptoModel.fromJson(Map<String, dynamic> json) {
    return CryptoModel(
      coin: json['coin'],
      wallet: json['wallet'],
      network: json['network'],
    );
  }
}
