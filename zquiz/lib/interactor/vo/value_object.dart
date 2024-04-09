abstract interface class ValueObject<T>{
  T get value;
  set value(T newValue);
  String? validator(T? v);
}
