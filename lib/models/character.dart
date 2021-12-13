class Character {

  String? name;
  String? image;

  Character({this.name, this.image});

  Character.fromJson(Map<String, dynamic> json){
    this.image = json['img'];
    this.name = json['name'];
  }

  Map<String, dynamic> toJson() => {
    'img': this.image,
    'name': this.name,
  };

}