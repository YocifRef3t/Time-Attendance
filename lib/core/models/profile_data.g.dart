// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProfileDataModelAdapter extends TypeAdapter<ProfileDataModel> {
  @override
  final int typeId = 2;

  @override
  ProfileDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProfileDataModel(
      id: fields[0] as String,
      companyName: fields[1] as String,
      branchName: fields[2] as String,
      employeeName: fields[3] as String,
      countryName: fields[4] as String,
      jobStatus: fields[5] as String,
      jobName: fields[6] as String,
      iDNumber: fields[7] as String,
      iDExpirationDate: fields[8] as String,
      employeeAddress: fields[9] as String,
      employeeEmail: fields[10] as String,
      employeePhone: fields[11] as String,
      totalSalary: fields[12] as String,
      workHour: fields[13] as String,
      employeeImage: fields[14] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ProfileDataModel obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.companyName)
      ..writeByte(2)
      ..write(obj.branchName)
      ..writeByte(3)
      ..write(obj.employeeName)
      ..writeByte(4)
      ..write(obj.countryName)
      ..writeByte(5)
      ..write(obj.jobStatus)
      ..writeByte(6)
      ..write(obj.jobName)
      ..writeByte(7)
      ..write(obj.iDNumber)
      ..writeByte(8)
      ..write(obj.iDExpirationDate)
      ..writeByte(9)
      ..write(obj.employeeAddress)
      ..writeByte(10)
      ..write(obj.employeeEmail)
      ..writeByte(11)
      ..write(obj.employeePhone)
      ..writeByte(12)
      ..write(obj.totalSalary)
      ..writeByte(13)
      ..write(obj.workHour)
      ..writeByte(14)
      ..write(obj.employeeImage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfileDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
