
class BaseEntity<T>{

  int resultCode;//200
  String resultMessage;
  T data;
  
  BaseEntity(this.resultCode, this.resultMessage, this.data);
}