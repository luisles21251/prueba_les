import 'package:formz/formz.dart';
import 'package:prueba_les/core/utils/utils.dart';



enum NumberInputError { empty, outRange, notNumber }

/// **validatorType**:
///
/// - **0** -> validate the number of numbers
/// - **1** -> validate the number in a range
///
/// **Warning!**, if validatorType is null return **NumberInputError.empty**
///
class NumberInput extends FormzInput<String, NumberInputError> {
  final String value;
  final int? validatorType;
  final double? start;
  final double? end;

  /// **validatorType**:
  ///
  /// - **0** -> validate the number of numbers
  /// - **1** -> validate the number in a range
  /// - **2** -> validate if the value is a number
  ///
  ///
  /// **Warning!**, if validatorType is null return **NumberInputError.empty**
  ///
  const NumberInput.pure({required this.value, this.validatorType = 0, this.start, this.end}) : super.pure('');

  /// **validatorType**:
  ///
  /// - **0** -> validate the number of numbers
  /// - **1** -> validate the number in a range
  /// - **2** -> validate if the value is a number
  ///
  /// **Warning!**, if validatorType is null return **NumberInputError.empty**
  ///
  const NumberInput.dirty(this.value, {this.validatorType = 0, this.start, this.end}) : super.dirty('');

  NumberInput copyWith(
    String value, {
    int? validatorType,
    double? start,
    double? end,
  }) {
    return NumberInput.dirty(
      value,
      validatorType: validatorType ?? this.validatorType,
      start: start ?? this.start,
      end: end ?? this.end,
    );
  }

  //  type: 0 -> length
  //        1 -> number
  //
  //  if type is null return NumberInputError.empty
  @override
  NumberInputError? validator(String ? value) {
    if (value == null || value == '') return NumberInputError.empty;

    switch (validatorType) {
      case 0:
        if (start != null && end != null) {
          return value.length >= start! && value.length <= end! ? null : NumberInputError.outRange;
        } else if (start != null) {
          return value.length >= start! ? null : NumberInputError.outRange;
        } else if (end != null) {
          return value.length <= end! ? null : NumberInputError.outRange;
        } else
          return null;

      case 1:
        if (start != null && end != null) {
          return (double.tryParse(value) ?? parseInt(value) ?? -1) >= start! && (double.tryParse(value) ?? parseInt(value) ?? -1) <= end! ? null : NumberInputError.outRange;
        } else if (start != null) {
          return (double.tryParse(value) ?? parseInt(value) ?? -1) >= start! ? null : NumberInputError.outRange;
        } else if (end != null) {
          return (double.tryParse(value) ?? parseInt(value) ?? -1) <= end! ? null : NumberInputError.outRange;
        } else
          return null;

      case 2:
        if (!RegExp(r'^\d+$').hasMatch(value))
          return NumberInputError.notNumber;
        else if (value.length == 0) return NumberInputError.empty;
        return null;

      default:
        return NumberInputError.empty;
    }
  }
}
