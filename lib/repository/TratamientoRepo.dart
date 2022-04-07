import 'package:gestorderecordatorios/model/MedicamentoService.dart';

abstract class TratamientoRepo{

  Future <List<Medicamento>> get_medicamentos(int id);
  void agregar_medicamento(Medicamento muestra, int id);
}

class TratamientoSqlite implements TratamientoRepo{
  @override
  void agregar_medicamento(Medicamento muestra, int id) async{
    // TODO: implement agregar_medicamento
  }

  @override
  Future<List<Medicamento>> get_medicamentos(int id)async {
    // TODO: implement get_medicamentos
    throw UnimplementedError();
  }

}