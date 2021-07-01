// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookMarkModelAdapter extends TypeAdapter<BookMarkModel> {
  @override
  final int typeId = 0;

  @override
  BookMarkModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookMarkModel(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
      fields[5] as String,
      fields[6] as String,
      fields[7] as String,
      fields[8] as String,
      fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BookMarkModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.author)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.url)
      ..writeByte(4)
      ..write(obj.source)
      ..writeByte(5)
      ..write(obj.image)
      ..writeByte(6)
      ..write(obj.category)
      ..writeByte(7)
      ..write(obj.language)
      ..writeByte(8)
      ..write(obj.country)
      ..writeByte(9)
      ..write(obj.publishedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookMarkModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
