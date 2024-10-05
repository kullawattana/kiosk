onCondition<R>({
  required bool condition,
  required R Function() builder,
  R Function()? fallback,
}) {
  return condition ? builder() : (fallback != null ? fallback() : null);
}
