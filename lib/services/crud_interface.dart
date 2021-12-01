abstract class CrudInterface<T>{
  Future<List<T>> getAll();
  Future create(Object T);
}