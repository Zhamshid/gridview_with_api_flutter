class Names {
  String? name;
  String? transliteration;
  int? number;
  En? en;

  Names({this.name, this.transliteration, this.number, this.en});

  Names.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    transliteration = json['transliteration'];
    number = json['number'];
    en = json['en'] != null ? En.fromJson(json['en']) : null;
  }

  List<dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    List<dynamic> data = map['data'];
    data[0]['name'] = name;
    data[0]['transliteration'] = transliteration;
    data[0]['number'] = number;
    if (en != null) {
      data[0]['en'] = en!.toJson();
    }
    return data;
  }
}

class En {
  String? meaning;

  En({this.meaning});

  En.fromJson(Map<String, dynamic> json) {
    meaning = json['meaning'];
  }

  List<dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    List<dynamic> data = map['data'];
    data[0]['en']['meaning'] = meaning;
    return data;
  }
}