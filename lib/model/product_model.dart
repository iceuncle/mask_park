import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductBean {
  ProductBean(
      {this.interestRate,
      this.serviceFee,
      this.minAmount,
      this.gracePeriodDays,
      this.periodStep,
      this.minPeriod,
      this.maxPeriod,
      this.id,
      this.minRepaymentAmount,
      this.gracePeriodRate,
      this.amountStep,
      this.overdueRate,
      this.maxAmount,
      this.description,
      this.updateTime,
      this.periodUnit,
      this.createTime,
      this.name,
      this.withholdMethod,
      this.certProgress,
      this.choose,
      this.checkedAmount,
      this.checkedPeriod});

  double interestRate;
  double serviceFee;
  double minAmount;
  int gracePeriodDays;
  int periodStep;
  int minPeriod;
  int maxPeriod;
  int id;
  double minRepaymentAmount;
  double gracePeriodRate;
  double amountStep;
  double overdueRate;
  double maxAmount;
  String description;
  String updateTime;
  String periodUnit;
  String createTime;
  String name;
  String withholdMethod;
  String certProgress;
  bool choose;
  double checkedAmount;
  int checkedPeriod;

  factory ProductBean.fromJson(Map<String, dynamic> json) =>
      _$ProductBeanFromJson(json);

  Map<String, dynamic> toJson() => _$ProductBeanToJson(this);
}
