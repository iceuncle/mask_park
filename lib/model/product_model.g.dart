// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductBean _$ProductBeanFromJson(Map<String, dynamic> json) {
  return ProductBean(
    interestRate: (json['interestRate'] as num)?.toDouble(),
    serviceFee: (json['serviceFee'] as num)?.toDouble(),
    minAmount: (json['minAmount'] as num)?.toDouble(),
    gracePeriodDays: json['gracePeriodDays'] as int,
    periodStep: json['periodStep'] as int,
    minPeriod: json['minPeriod'] as int,
    maxPeriod: json['maxPeriod'] as int,
    id: json['id'] as int,
    minRepaymentAmount: (json['minRepaymentAmount'] as num)?.toDouble(),
    gracePeriodRate: (json['gracePeriodRate'] as num)?.toDouble(),
    amountStep: (json['amountStep'] as num)?.toDouble(),
    overdueRate: (json['overdueRate'] as num)?.toDouble(),
    maxAmount: (json['maxAmount'] as num)?.toDouble(),
    description: json['description'] as String,
    updateTime: json['updateTime'] as String,
    periodUnit: json['periodUnit'] as String,
    createTime: json['createTime'] as String,
    name: json['name'] as String,
    withholdMethod: json['withholdMethod'] as String,
    certProgress: json['certProgress'] as String,
    choose: json['choose'] as bool,
    checkedAmount: (json['checkedAmount'] as num)?.toDouble(),
    checkedPeriod: json['checkedPeriod'] as int,
  );
}

Map<String, dynamic> _$ProductBeanToJson(ProductBean instance) =>
    <String, dynamic>{
      'interestRate': instance.interestRate,
      'serviceFee': instance.serviceFee,
      'minAmount': instance.minAmount,
      'gracePeriodDays': instance.gracePeriodDays,
      'periodStep': instance.periodStep,
      'minPeriod': instance.minPeriod,
      'maxPeriod': instance.maxPeriod,
      'id': instance.id,
      'minRepaymentAmount': instance.minRepaymentAmount,
      'gracePeriodRate': instance.gracePeriodRate,
      'amountStep': instance.amountStep,
      'overdueRate': instance.overdueRate,
      'maxAmount': instance.maxAmount,
      'description': instance.description,
      'updateTime': instance.updateTime,
      'periodUnit': instance.periodUnit,
      'createTime': instance.createTime,
      'name': instance.name,
      'withholdMethod': instance.withholdMethod,
      'certProgress': instance.certProgress,
      'choose': instance.choose,
      'checkedAmount': instance.checkedAmount,
      'checkedPeriod': instance.checkedPeriod,
    };
