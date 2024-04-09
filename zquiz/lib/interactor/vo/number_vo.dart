import 'package:zquiz/interactor/vo/value_object.dart';

class NumberValueObject implements ValueObject<int>{
  final int minV, maxV;
  int _value;

  @override
  int get value => _value;

  @override
  set value(int newValue) => _value = newValue;

  NumberValueObject(this._value, this.minV, this.maxV);
  factory NumberValueObject.create({
    int? minV, int? maxV
  }) => NumberValueObject(0, minV ?? 0, maxV ?? 99999);

  @override
  String? validator(int? value) {
    value ??= _value;
    if(value < minV){
      return "It need to be greater than '$minV'";
    }
    if(value > maxV){
      return "It need to be less than '$maxV'";
    }
    return null;
  }
}
