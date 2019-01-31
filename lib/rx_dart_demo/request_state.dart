class RequestState {}

class RequestError extends RequestState {}

class RequestEmpty extends RequestState {}

class RequestPopulated<T> extends RequestState {
  final T resultData;

  RequestPopulated({this.resultData});
}

class RequestInitial extends RequestState{}
