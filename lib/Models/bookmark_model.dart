
import 'package:hive/hive.dart';
part 'bookmark_model.g.dart';

@HiveType(typeId: 0)
class BookMarkModel {
  @HiveField(0)
  String author;
  @HiveField(1)
  String title;
  @HiveField(2)
  String description;
  @HiveField(3)
  String url;
  @HiveField(4)
  String source;
  @HiveField(5)
  String image;
  @HiveField(6)
  String category;
  @HiveField(7)
  String language;
  @HiveField(8)
  String country;
  @HiveField(9)
  String publishedAt;

  BookMarkModel(
      this.author,
      this.title,
      this.description,
      this.url,
      this.source,
      this.image,
      this.category,
      this.language,
      this.country,
      this.publishedAt);
}
