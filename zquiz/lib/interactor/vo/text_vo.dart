import 'package:zquiz/interactor/vo/value_object.dart';

class TextValueObject implements ValueObject<String>{
  final int minCaracters, maxCaracters;
  String _value;

  @override
  String get value => _value;

  @override
  set value(String newValue) => _value = newValue;

  TextValueObject(this._value, this.minCaracters, this.maxCaracters);
  factory TextValueObject.create({
    int? minCaracters, int? maxCaracters
  }) => TextValueObject("", minCaracters ?? 0, maxCaracters ?? 9999999);

  @override
  String? validator(String? value) {
    value ??= _value;
    if(value.isEmpty){
      return "It can't be empty";
    }
    if(value.length < minCaracters){
      return "It need to be greater than '$minCaracters'";
    }
    if(value.length > maxCaracters){
      return "It need to be less than '$maxCaracters'";
    }
    return null;
  }
}
