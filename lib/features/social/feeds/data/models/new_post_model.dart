class NewPostModel {
  String uID;
  String name;
  String image;
  String postImage;
  String dateTime;
  String text;

  NewPostModel({
    required this.uID,
    required this.name,
    required this.image,
    required this.postImage,
    required this.dateTime,
    required this.text,
  });

  factory NewPostModel.fromJson(Map<String, dynamic> json) {
    return NewPostModel(
      uID: json['uID'],
      name: json['name'],
      postImage: json['postImage'],
      dateTime: json['dateTime'],
      text: json['text'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uID': uID,
      'name': name,
      'postImage': postImage,
      'dateTime': dateTime,
      'text': text,
      'image': image,
    };
  }
}
