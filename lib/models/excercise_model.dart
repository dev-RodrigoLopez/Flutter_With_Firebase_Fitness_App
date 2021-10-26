class Exercise {
  Exercise({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.gif,
    required this.seconds,
  });
  late final String id;
  late final String title;
  late final String thumbnail;
  late final String gif;
  late final String seconds;
  
  Exercise.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    thumbnail = json['thumbnail'];
    gif = json['gif'];
    seconds = json['seconds'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['thumbnail'] = thumbnail;
    _data['gif'] = gif;
    _data['seconds'] = seconds;
    return _data;
  }
}