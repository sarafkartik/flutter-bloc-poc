import 'dart:convert';

RandomMessageDto randomChatModelFromJson(String str) =>
    RandomMessageDto.fromJson(json.decode(str));

String randomChatModelToJson(RandomMessageDto data) =>
    json.encode(data.toJson());

class RandomMessageDto {
  String? id;
  String? content;
  String? authorSlug;

  RandomMessageDto({
    this.id,
    this.content,
    this.authorSlug,
  });

  factory RandomMessageDto.fromJson(Map<String, dynamic> json) =>
      RandomMessageDto(
        id: json["_id"],
        content: json["content"],
        authorSlug: json["authorSlug"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "content": content,
        "authorSlug": authorSlug,
      };
}
