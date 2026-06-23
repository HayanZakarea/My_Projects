
class DataState<T>{

  final T? data;
  final String message;
  final DataStatus status;

  const DataState({this.data, this.message = '', this.status = DataStatus.init});



  bool get isLoading => status == DataStatus.loading;
  bool get isSuccess => status == DataStatus.success;
  bool get isFail => status == DataStatus.fail;
  bool get isInit => status == DataStatus.init;
}

enum DataStatus{
  loading,
  fail,
  success,
  init
}

extension isX on DataStatus {

  bool get isLoading => this == DataStatus.loading;
  bool get isSuccess => this == DataStatus.success;
  bool get isFail => this == DataStatus.fail;
  bool get isInit => this == DataStatus.init;

}