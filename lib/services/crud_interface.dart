abstract class CrudInterface<T>{
  Future getAll(Object T);
  Future create(Object T);
}