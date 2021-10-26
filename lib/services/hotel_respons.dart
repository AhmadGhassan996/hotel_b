class HBResponse<T> {
  Status status = Status.FRESH;
  String? message;
  T? data;

  HBResponse.loading() : status = Status.LOADING;
  HBResponse.fresh() : status = Status.FRESH;
  HBResponse.completed(this.data) : status = Status.COMPLETED;
  HBResponse.error(this.message) : status = Status.ERROR;
}

enum Status {
  LOADING,
  COMPLETED,
  FRESH,
  ERROR,
}
