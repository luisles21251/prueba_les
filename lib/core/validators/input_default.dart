import 'package:formz/formz.dart';

enum InputDefaultError { empty }

class InputDefault extends FormzInput<String, InputDefaultError>{
  const InputDefault.pure() : super.pure('');
  const InputDefault.dirty([String value = '']) : super.dirty(value);

  @override
  InputDefaultError? validator(String value) {
    return value.isNotEmpty == true ? null : InputDefaultError.empty;
  }
}