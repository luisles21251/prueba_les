
import 'package:email_validator/email_validator.dart';
import 'package:formz/formz.dart';
enum EmailValidatorEnum { invalid }

class Email extends FormzInput<String, EmailValidatorEnum> {
  const Email.pure() : super.pure('');
  const Email.dirty([String value = '']) : super.dirty(value);
  @override
  EmailValidatorEnum? validator(String value) {
    return EmailValidator.validate(value) ? null : EmailValidatorEnum.invalid;
  }

}