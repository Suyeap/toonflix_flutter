class WebtoonModel {
  final String title, thumb, id;

// named constructure
  WebtoonModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        thumb = json['thumb'],
        id = json['id'];

  // 기본 생성자
  // WebtoonModel({
  //   required this.id,
  //   required this.title,
  //   required this.thumb,
  // });
}
