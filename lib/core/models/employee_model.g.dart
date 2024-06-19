// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EmployeeModelAdapter extends TypeAdapter<EmployeeModel> {
  @override
  final int typeId = 1;

  @override
  EmployeeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EmployeeModel(
      token: fields[0] as String,
      id: fields[15] as int,
      nameAr: fields[1] as String,
      nameEn: fields[2] as String,
      companyNameAr: fields[3] as String,
      companyNameEn: fields[4] as String,
      companyId: fields[14] as int,
      userName: fields[5] as String,
      phone: fields[6] as String,
      email: fields[7] as String,
      address: fields[8] as String,
      employeeType: fields[9] as String,
      jobNameAr: fields[10] as String,
      jobNameEn: fields[11] as String,
      countryNameAr: fields[12] as String,
      countryNameEn: fields[13] as String,
      empType: fields[16] as int,
    );
  }

  @override
  void write(BinaryWriter writer, EmployeeModel obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.token)
      ..writeByte(1)
      ..write(obj.nameAr)
      ..writeByte(2)
      ..write(obj.nameEn)
      ..writeByte(3)
      ..write(obj.companyNameAr)
      ..writeByte(4)
      ..write(obj.companyNameEn)
      ..writeByte(5)
      ..write(obj.userName)
      ..writeByte(6)
      ..write(obj.phone)
      ..writeByte(7)
      ..write(obj.email)
      ..writeByte(8)
      ..write(obj.address)
      ..writeByte(9)
      ..write(obj.employeeType)
      ..writeByte(10)
      ..write(obj.jobNameAr)
      ..writeByte(11)
      ..write(obj.jobNameEn)
      ..writeByte(12)
      ..write(obj.countryNameAr)
      ..writeByte(13)
      ..write(obj.countryNameEn)
      ..writeByte(14)
      ..write(obj.companyId)
      ..writeByte(15)
      ..write(obj.id)
      ..writeByte(16)
      ..write(obj.empType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmployeeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
