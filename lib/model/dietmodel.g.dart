// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dietmodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DietmodelAdapter extends TypeAdapter<Dietmodel> {
  @override
  final int typeId = 2;

  @override
  Dietmodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Dietmodel(
      id: fields[0] as int?,
      type: fields[1] as String?,
      breakfastMeal: fields[2] as String?,
      breakfastCalories: fields[3] as int?,
      lunchMeal: fields[4] as String?,
      lunchCalories: fields[5] as int?,
      dinnerMeal: fields[6] as String?,
      dinnerCalories: fields[7] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Dietmodel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.breakfastMeal)
      ..writeByte(3)
      ..write(obj.breakfastCalories)
      ..writeByte(4)
      ..write(obj.lunchMeal)
      ..writeByte(5)
      ..write(obj.lunchCalories)
      ..writeByte(6)
      ..write(obj.dinnerMeal)
      ..writeByte(7)
      ..write(obj.dinnerCalories);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DietmodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
