/// code : 200
/// status : "OK"
/// data : [{"name":"الرَّحْمَنُ","transliteration":"Ar Rahmaan","number":1,"en":{"meaning":"The Beneficent"}}]

class Names {
  Names({this.code, this.status, this.data});

  Names.fromJson(dynamic json) {
    code = json['code'];
    status = json['status'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  int? code;
  String? status;
  List<Data>? data;
  Names copyWith({
    int? code,
    String? status,
    List<Data>? data,
  }) =>
      Names(
        code: code ?? this.code,
        status: status ?? this.status,
        data: data ?? this.data,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// name : "الرَّحْمَنُ"
/// transliteration : "Ar Rahmaan"
/// number : 1
/// en : {"meaning":"The Beneficent"}

class Data {
  Data({this.name, this.transliteration, this.number, this.en});

  Data.fromJson(dynamic json) {
    name = json['name'];
    transliteration = json['transliteration'];
    number = json['number'];
    en = json['en'] != null ? En.fromJson(json['en']) : null;
  }
  String? name;
  String? transliteration;
  int? number;
  En? en;
  Data copyWith({
    String? name,
    String? transliteration,
    int? number,
    En? en,
  }) =>
      Data(
        name: name ?? this.name,
        transliteration: transliteration ?? this.transliteration,
        number: number ?? this.number,
        en: en ?? this.en,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['transliteration'] = transliteration;
    map['number'] = number;
    if (en != null) {
      map['en'] = en?.toJson();
    }
    return map;
  }
}

/// meaning : "The Beneficent"

class En {
  En({this.meaning});

  En.fromJson(dynamic json) {
    meaning = json['meaning'];
  }
  String? meaning;
  En copyWith({
    String? meaning,
  }) =>
      En(
        meaning: meaning ?? this.meaning,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['meaning'] = meaning;
    return map;
  }
}
