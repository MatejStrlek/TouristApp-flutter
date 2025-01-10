abstract interface class Mapper<S, T> {
  T convert(S source);
  S revert(T source);
}